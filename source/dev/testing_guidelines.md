## Best practices for adding new code

### Minimally, we need tests which:
1. Demonstrate that a particular functionality is working
2. Show that the effect of new code is understood, and less likely to interact with the rest of code base in unexpected ways
3. Validate that a bug has been fixed and we can detect the problem in the future

### What's the benefit to the team?
1. Reading test code allows others to more easily understand and work with our code
2. Ensures a consistent level of functionality testing for all subsequent changes
3. Speeds up future changes because we can instantly test to see if a change works as expected

### Where do unit tests go?

Unit tests should go in a folder named `tests` in the same folder where is located. Later we can include these tests in a larger collection along with integration tests.

## How do we test if a feature works?

Since we're dealing with data, it helps to have a toy model which has the following characteristics:
1. Has enough variation to the test different cases which arise due to branching in the code\
(i.e. include generators of different types to test that code handles scaling for the right type of generators)
2. Yet still small enough to be able to verify overall correctness manually
3. Particular values in the data set are easy to work with and confirm manually (i.e. use `5` instead of `4.624754`)
4. Includes just the data needed for the code to run - in testing it's better to have an error if the code ever attempts to change something unexpectedly

Here's an example of a toy grid model which includes `plant` and `branch` fields in order to test scaling code:
``` python
class GridMock:
    def __init__(self, fieldNames):
        if 'plant' in fieldNames:
            self.plant = pd.DataFrame( {'plant_id': [101,102,103,104,105],
                                        'type': ['solar','wind','ng','coal','thermal'],\
                                        'zone_id': [1,2,3,1,3],\
                                        'GenMWMax':[200,150,100,300,120],\
                                        'Pmin':    [20,30,25,100,20],\
                                        'Pmax':    [40,80,50,150,80]})
            self.plant.set_index('plant_id', inplace=True)

        if 'branch' in fieldNames:
            self.branch = pd.DataFrame({'from_zone_id': [1,2,3,1,3],\
                                        'to_zone_id':   [1,3,2,2,3],\
                                        'branch_id':    [11,12,13,14,15],\
                                        'rateA':        [10,20,30,40,50],\
                                        'x':            [0.1,0.2,0.3,0.4,0.5]})
            self.branch.set_index('branch_id', inplace=True)
```

### 1. Python – specific
* How do I run tests?

`python -m unittest -v TestFilename.py`

More info on Python testing can be found here:\
https://cgoldberg.github.io/python-unittest-tutorial/

* How do I write tests?

Here's a function that gets the plant ids for generators which are from a particular location and fuel type:
``` python
# function to get plant_ids in a particular zone and fuel type
def get_plant_ids_by_type(grid, zone, gentype):
    plant_ids = grid.plant.groupby(['zone_id', 'type'])\
                .get_group((zone, gentype)).index.values.tolist()
    return plant_ids
```

Testing this function is pretty straightforward with the GridMock grid. We use `GridMock(['plant'])` for the test data, as we only expect to need generator data and not the branch data. If we provide branch data by calling `GridMock(['plant','branch'])`, then there will be the possibility that the branch data is modified by our code as well. 

**When using the unittest testing framework, all test method names must start with the word 'test' to be executed by the test runner. Also the name of the test should indicate what the test is trying to accomplish. All tests should have at least one assertion, otherwise all you are really checking is “does_not_crash_when_called” and that usually isn’t super interesting.**
``` python
import unittest
from GridMock import *

class TestScalarMethods(unittest.TestCase):

    # check that gridmock is working correctly
    def test_gridmock_creates_grid(self): 
        grid = GridMock('plant')
        self.assertTrue(isinstance(grid, object), 'GridMock should return an object')
        self.assertTrue(hasattr(grid, 'plant'), 'Plant property should be in the GridMock')
        self.assertFalse(hasattr(grid, 'branch'), 'Branch property should not be in the GridMock')

    def test_nonthermal_scaling(self):
        grid = GridMock(['plant'])
        plantIds = get_plant_ids_by_type(grid, 2, 'wind')

        self.assertEqual(len(plantIds), 1, f”Grid should have exactly 1 wind plant, got {len(plantIds)}.”)
        self.assertEqual(plantIds, 102, 'Wind plant should be id=102, got {plantIds}.')

if __name__ == '__main__':
    unittest.main() 
```

Another example, this function scales values in the `GenMWMax` column for particular generator `plant_ids`.
``` python
# function to transform generator GenMWMax property
def scale_GenMWMax(self, grid, gentype, plant_ids, value):
    if gentype in self._gen_types:
        grid.plant.loc[plant_ids, 'GenMWMax'] *= value
    return grid
```

To test this function, we make the property `_gen_types` available as a class property using the `setUpClass(cls)` method. The `setUp(self)` method creates a new grid before every test. Then `test_nonthermal_scaling(self)` checks that the correct `GenMWMax` values are changed, and the remaining generator columns are unchanged.
``` python
import unittest
from GridMock import *

class TestScalarMethods(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls._gen_types = ['coal', 'dfo', 'geothermal', 'ng', 'nuclear', 'hydro', 'solar', 'wind']

    def setUp(self):
        self._original_grid = GridMock(['plant'])

    def test_nonthermal_scaling(self):
        baseGrid = self._original_grid

        newGrid = GridMock(['plant'])
        newGrid = scale_GenMWMax(self, newGrid, 'wind', [102], 3)

        self.assertEqual(newGrid.plant['GenMWMax'].tolist(),[200,3*150,100,300,120],'Scaling was not applied!')

        self.assertEqual(newGrid.plant[['zone_id','Pmin','Pmax']].values.tolist(),\
                         baseGrid.plant[['zone_id','Pmin','Pmax']].values.tolist(),\
                                        'Scaling affected other generator properties!')

# entry point for running tests
if __name__ == '__main__':
    unittest.main() 
```

### 2. Matlab – specific
* How do I run tests?

`results = runtests('exampleTest.m')`

More info about Matlab function-based tests can be found here:\
https://www.mathworks.com/help/matlab/matlab_prog/write-function-based-unit-tests-.html
https://www.mathworks.com/help/matlab/matlab_prog/write-simple-test-case-with-functions.html

* How do I write tests?

This function adds a piece-wise cost model to the case struct. We've encapsulated the code into a function that takes in the `mpc` struct as an input and outputs a modified `mpc` with the new cost model. 
``` matlab
function mpc = AddLinearizedCost(mpc,num_segments)
    % AddLinearizedCost  Adds piecewise-linear cost model to existing mpc struct.
    %
    %   usage:
    %   mpc = AddLinearizedCost(mpc,num_segments)
    %   
    %   inputs:
    %     mpc struct with assumed quadratic gencost
    %     num_segments is the number of desired segments for the linearization

    % validate inputs
    assert(isstruct(mpc),'mpc must be a struct!');
    assert(num_segments == floor(num_segments), 'num_segments must be a whole number!');
    assert(isscalar(num_segments), 'num_segments must be a scalar value!');
    assert(num_segments > 0, 'num_segments must be positive!');

    define_constants;

    diffP = mpc.gen(:, PMAX) >  mpc.gen(:, PMIN);

    % Linearize the cost function using an arbitrary number of linear segments
    power_step = (mpc.gen(diffP, PMAX) - mpc.gen(diffP, PMIN)) / num_segments;
    assert(all(power_step ~= 0), "power_step is zero when computing costs!")

    % First store the original quadratic parameters
    old_a = mpc.gencost(diffP,COST);
    old_b = mpc.gencost(diffP,COST+1);
    old_c = mpc.gencost(diffP,COST+2);

    %See 'Table B-4: Generator Cost Data' in the MATPOWER manual v7.0
    mpc.gencost(diffP,MODEL) = 1;
    mpc.gencost(diffP,NCOST) = num_segments + 1;

    %Then set an appropriate number of (x,y) pairs
    for i = 0:num_segments
        x = mpc.gen(diffP, PMIN) + i*power_step;
        mpc.gencost(diffP,COST+(2*i)) = x;
        mpc.gencost(diffP,COST+(2*i)+1) = old_a.*x.^2 + old_b.*x + old_c;
    end
end
```

To use function-based, we always need the following code to run the test functions:
``` matlab
function tests = testAddLinearizedCost
    % Main function to call tests
    % Call using: results = runtests('testAddLinearizedCost.m')
    tests = functiontests(localfunctions);
end
```

Here we setup the constant and a toy `mpc` struct with minimal attributes necessary for the code to run properly:
``` matlab
function setupOnce(testCase)
    testCase.TestData.MODEL = 1;
    testCase.TestData.NCOST = 4;
    testCase.TestData.COST = 5;
    testCase.TestData.PMAX = 9;
    testCase.TestData.PMIN = 10;
end

% create a minimal mpc struct 
% only adding the data columns necessary to test functionality 
function setup(testCase)
    MODEL = testCase.TestData.MODEL;
    NCOST = testCase.TestData.NCOST;
    COST = testCase.TestData.COST;
    PMAX = testCase.TestData.PMAX;
    PMIN = testCase.TestData.PMIN;

    mpc.gencost(1:3,COST) = (1:3)';
    mpc.gencost(1:3,COST+1) = (4:6)';
    mpc.gencost(1:3,COST+2) = (7:9)';
    mpc.gencost(:,MODEL) = 2;
    mpc.gencost(:,NCOST) = 3;

    mpc.gen(1:3, PMIN) = 2*[10,20,30]';
    mpc.gen(1:3, PMAX) = 5*[10,20,30]';

    testCase.TestData.mpc = mpc;
end
```

Here we test that `gencost` is modified as expected by constructing the changes directly as the matrix `A`. We use the Matlab function `isequal()` to compare the matrices return a Boolean answer.
``` matlab
% tests the case of a single segment for the cost curve
function TestOneSegment(testCase)
    % power_step is [30,60,90]

    MODEL = testCase.TestData.MODEL;
    NCOST = testCase.TestData.NCOST;
    COST = testCase.TestData.COST;

    old_mpc = testCase.TestData.mpc;
    mpc = AddLinearizedCost(old_mpc, 1);

    verifyEqual(testCase,mpc.gencost(:,MODEL),ones(3,1));
    verifyEqual(testCase,mpc.gencost(:,NCOST),2*ones(3,1));

    A = [20,quadCost(1,4,7,20), 50, quadCost(1,4,7,50);...
        40,quadCost(2,5,8,40), 100, quadCost(2,5,8,100);...
        60,quadCost(3,6,9,60), 150, quadCost(3,6,9,150)];

    verifyTrue(testCase,isequal(mpc.gencost(:,COST:end),A));
end

% computes the quadratic cost for given coefficients a,b,c and x as the
% power step
function cost = quadCost(a,b,c,x)
    cost = a*x^2+b*x+c;
end
```
The complete code for the example above can be found in this PR:
https://github.com/intvenlab/REISE/pull/33/files