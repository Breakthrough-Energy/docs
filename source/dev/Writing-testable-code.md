This material is a summary of the content of this article:
https://www.toptal.com/qa/how-to-write-testable-code-and-why-it-matters
For more details, go read it!

Developers often think that their struggles writing unit tests are caused by a lack of some fundamental testing knowledge or secret unit testing techniques. Unit tests should be quite easy; the real problems that complicate unit testing, and introduce expensive complexity, are a result of poorly-designed, untestable code. Writing unit tests and generating testable code is not just about making testing less troublesome, but about making the code itself more robust, and easier to maintain.

## What's a unit test?

Unit test: a method that instantiates a small portion of our application and verifies its behavior **independently from other parts**. It does not test how everything interacts and works together.
A typical unit test does three things:

* Sets up data
* Calls the function you want to check using that data
* Checks that the function return values match what you expect, or that the function throws the exception you expect when something goes wrong

Here's a super simple example:

```python
def my_func(val):
    return val + 2

def test_my_func():
    val = 5
    returned_val = my_func(val)
    expected_result = 7
    assert returned_val == expected_result
```

For more info on unit testing please check out our [testing guidelines wiki page](https://github.com/intvenlab/REISE/wiki/Testing-Guidelines-for-Python-and-Matlab).

# What makes code hard to test?

## Problem: Non-deterministic factors

Imagine that we are writing a program for a smart home microcontroller, and one of the requirements is to automatically turn on the light in the backyard if some motion is detected there during the evening or at night. We have started from the bottom up by implementing a method that returns a string representation of the approximate time of day (“Night”, “Morning”, “Afternoon” or “Evening”).

```python
def get_time_of_day():
    time = DateTime.Now

    if (time.Hour >= 0 and time.Hour < 6):
        return "Night"
    if (time.Hour >= 6 and time.Hour < 12):
        return "Morning"
    if (time.Hour >= 12 and time.Hour < 18):
        return "Afternoon"
    return "Evening"
```

This method looks simple, but it is very difficult to write a proper state-based unit test for it. `DateTime.Now` is, essentially, a hidden input that we can't control. Every time we run the test it might be a different time of day, thus subsequent calls to this will produce different results.

Such non-deterministic behavior makes it impossible to test the internal logic of the `GetTimeOfDay()` method without actually changing the system date and time.

```python
def test_get_time_of_day_at_6AM_returns_morning():
    try:
        # Setup: change system time to 6 AM
        ...

        # Arrange phase is empty: testing static method, nothing to initialize

        # Act
        timeOfDay = get_time_of_day()

        # Assert
        assert timeOfDay == 'morning'

    finally:
        # Teardown: roll system time back
        ...
```

Problems with this test:
* lots of work to write 
    * because of the non-trivial setup and teardown logic
* unreliable 
    * it may fail even if there are no bugs in the system under test, due to system permission issues, for example 
* not guaranteed to run fast
* not actually a unit test
    * it would be something between a unit and integration test, because it pretends to test a simple edge case but requires an environment to be set up in a particular way.

All these testability problems are caused by the low-quality `GetTimeOfDay()` API. In its current form, this method suffers from several issues:

* It is **tightly coupled** to the concrete data source. It is not possible to reuse this method for processing date and time retrieved from other sources, or passed as an argument; the method works only with the date and time of the particular machine that executes the code. Tight coupling is the primary root of most testability problems.
* It violates the **[Single Responsibility Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle)** (SRP). The method has multiple responsibilities; it consumes the information and also processes it. Another indicator of SRP violation is when a single class or method has more than one reason to change. From this perspective, the `GetTimeOfDay()` method could be changed either because of internal logic adjustments, or because the date and time source should be changed.
* It lies about the information required to get its job done. Developers must read every line of the actual source code to understand what hidden inputs are used and where they come from. **The method signature alone is not enough to understand the method’s behavior.**
* It is hard to predict and maintain. The **behavior of a method that depends on a mutable global state cannot be predicted** by merely reading the source code; it is necessary to take into account its current value, along with the whole sequence of events that could have changed it earlier. In a real-world application, trying to unravel all that stuff becomes a real headache.

### Option 1: Fixing the code with Dependency Injection

Easy solution: pass the time in with an argument

```python
def get_time_of_day(time):
    if (time.Hour >= 0 and time.Hour < 6):
        return "Night"
    if (time.Hour >= 6 and time.Hour < 12):
        return "Morning"
    if (time.Hour >= 12 and time.Hour < 18):
        return "Afternoon"
    return "Evening"
```

From the unit testing perspective, this is great; the method is now deterministic (i.e., its return value fully depends on the input), so state-based testing is as easy as passing some DateTime value and checking the result.

```python
def test_get_time_of_day_at_6AM_returns_morning():
    datetime = DateTime(2015, 12, 31, 06, 00, 00)
    time_of_day = get_time_of_day(datetime)
    assert time_of_day == 'morning'
```

We have a new problem though. Now whoever calls `get_time_of_day()` needs to provide the date and time -- essentially moving the problem up the chain. This can be fixed using **[Dependency Injection](https://en.wikipedia.org/wiki/Dependency_injection)** and **[Inversion of Control](https://en.wikipedia.org/wiki/Inversion_of_control)**.

Dependency Injection: a technique whereby one object supplies the dependencies of another object. 

Inversion of Control: The key point of IoC is to separate decision-making code (when to do something) from action code (what to do when something happens). This technique increases flexibility, makes our code more modular, and reduces coupling between components.

Here's a quick example:

```python
class DateTimeGetter:
    def get_time():
        return DateTime.now()

def get_time_of_day(date_time_getter):
    time = time_getter.get_time()

    if (time.Hour >= 0 and time.Hour < 6):
        return "Night"
    if (time.Hour >= 6 and time.Hour < 12):
        return "Morning"
    if (time.Hour >= 12 and time.Hour < 18):
        return "Afternoon"
    return "Evening"

class MockDateTimeGetter:
    def __init__(self, date_time):
        self.date_time = date_time

    def get_time():
        return self.date_time

def test_get_time_of_day_at_6AM_returns_morning():
    time_getter = MockDateTimeGetter(DateTime(2015, 12, 31, 06, 00, 00))
    time_of_day = get_time_of_day(time_getter)
    assert time_of_day == 'morning'
```

This is great because now production code and unit test code can have different ways to get the time. In the production environment, some real-life implementation will be injected (e.g., one that reads actual system time). In the unit test, however, we can inject a “fake” implementation that returns a constant or predefined DateTime value suitable for testing the particular scenario.

### Option 2: Fixing the code with Higher Order Functions

An alternative approach to Dependency Injection is to use [Higher-Order Functions](https://en.wikipedia.org/wiki/Higher-order_function). Higher-order functions can be thought of as another way of implementing Inversion of Control.

**higher-order function**: a function that does at least one of the following:

* takes one or more functions as arguments (i.e. procedural parameters)
* returns a function as its result

It should be noted that in order to have first class functions, your programming language needs to be able to pass functions as arguments. Almost every language including Python and MATLAB can do this. Java, Lisp, and Ruby cannot. 

Here's what the code looks like:

```python
def get_time_of_day(get_date_time_method):
    time = get_date_time_method()

    if (time.Hour >= 0 and time.Hour < 6):
        return "Night"
    if (time.Hour >= 6 and time.Hour < 12):
        return "Morning"
    if (time.Hour >= 12 and time.Hour < 18):
        return "Afternoon"
    return "Evening"

def test_get_time_of_day_at_6AM_returns_morning():
    get_date_time_method = lambda: DateTime(2015, 12, 31, 06, 00, 00)
    time_of_day = get_time_of_day(get_date_time_method)
    assert time_of_day == 'morning'
```

As you can see, Higher Order Functions often let us achieve the same result with less code, and more expressiveness, than Dependency Injection. It is no longer necessary to implement a class that must have specific functions in order to supply `get_time_of_day()` with the required functionality; instead, we can just pass a function definition.

## Problem: Side Effects

A function with [Side Effects](https://en.wikipedia.org/wiki/Side_effect_(computer_science)) triggers some state changes in the system outside of itself. Some examples are:

* modifying a non-local variable
* modifying a static local variable
* modifying a mutable argument passed by reference
* performing I/O
* calling other side-effect functions

The only way to verify that these state changes happened correctly is to test whether the corresponding side effects actually happened or not, which could be painful. Side effects, like non-deterministic code, lead to deceptive, hard to understand and maintain, tightly coupled, non-reusable, and untestable code.

Methods that are both deterministic and side-effect-free are called [Pure Functions](https://en.wikipedia.org/wiki/Pure_function). We’ll rarely have a problem unit testing a pure function; all we have to do is to pass some arguments and check the result for correctness. What really makes code untestable is hard-coded, impure factors that cannot be replaced, overridden, or abstracted away in some other way.

Impurity is toxic: if method `Foo()` depends on non-deterministic or side-effecting method `Bar()`, then `Foo()` becomes non-deterministic or side-effecting as well. Eventually, we may end up poisoning the entire codebase. Multiply all these problems by the size of a complex real-life application, and we’ll find ourselves encumbered with a hard to maintain codebase full of smells, anti-patterns, secret dependencies, and all sorts of ugly and unpleasant things.

However, impurity is inevitable; any real-life application must, at some point, read and manipulate state by interacting with the environment, databases, configuration files, web services, or other external systems. So instead of aiming to eliminate impurity altogether, it’s a good idea to limit these factors, avoid letting them poison your codebase, and break hard-coded dependencies as much as possible, in order to be able to analyze and unit test things independently.

## Problem: Global mutable state

### Static Properties and Fields

Mutable static properties and fields are global state! They can hide the information required for a method to get its job done, introduce non-determinism, or promote extensive usage of side effects. Functions that read or modify mutable global state are inherently impure.

Example:

```python
if (SmartHomeSettings.CostSavingEnabled is False): 
    _swimmingPoolController.HeatWater()
```

What if the `HeatWater()` method doesn’t get called when we are sure it should have been? Since any part of the application might have changed the `CostSavingEnabled` value, we must find and analyze all the places modifying that value in order to find out what’s wrong. Also, as we’ve already seen, it is not possible to set some static properties for testing purposes; they are read-only, but still non-deterministic.

Note that global *constants* that never change do not cause non-determinism or side-effects.

```python
def circumference(radius):
    return 2 * Math.PI * radius # Because Math.PI is a global constant, this is still a pure function!
```

## Singletons 

Essentially, the Singleton pattern is just another form of the global state. Singletons promote obscure APIs that lie about real dependencies and introduce unnecessarily tight coupling between components. They also violate the Single Responsibility Principle because, in addition to their primary duties, they control their own initialization and lifecycle.

Singletons can easily make unit tests order-dependent because they carry state around for the lifetime of the whole application or unit test suite. Have a look at the following example:

```python
def GetUser(userId):
    if (UserCache.Instance.ContainsKey(userId)):
        user = UserCache.Instance[userId]
    else:
        user = _userService.LoadUser(userId)
        UserCache.Instance[userId] = user

    return user
```

In the example above, if a test for the cache-hit scenario runs first, it will add a new user to the cache, so a subsequent test of the cache-miss scenario may fail because it assumes that the cache is empty. To overcome this, we’ll have to write additional teardown code to clean the `UserCache` after each unit test run. Sounds like a lot of work.

# Summary

* Keep your functions simple by using the **Single Responsibility Principle**
    * Functions only have one responsibility and therefore one reason to change
    * Responsibilities can include getting data, processing data, outputting data
* **Avoid mutable global state**, including mutable static properties and singletons
    * Really hard to debug because global state can be changed anywhere in the codebase
    * Global constants are fine because they cannot be changed 
* **Use pure functions** whenever possible - no side effects or non-deterministic behavior
* **Side effects** include modifying global state or calling other side-effect functions
* **Impurity is inevitable** - we need to read files, databases, get user input, etc
    * But you can keep impure code as far away from your functions as possible
    * Break hard-coded dependencies so you can swap them out when testing

### Problem Code:

```python
def is_my_dog_nearby(my_id, dog_id):
    dog_location = GPS.get_location(dog_id) # GPS is a hard-coded dependency
    my_location = GPS.get_location(my_id)

    if distance(my_location, dog_location, 'mi') < 0.2:
       return True
    else: 
        return False

def test_is_my_dog_nearby_returns_true_when_nearby():
    # First we have figure out how to to get GPS to return fake values
    # It might not even be possible!
    ....

    result = is_my_dog_nearby(my_id = 123, dog_id = 456)
    assert result == True
```

### How to fix:

* Pass in the location value from above
    * `is_my_dog_nearby(my_id, dog_id, location)`
    * This is the easiest way but it mostly just passes the problem onto the calling function 
* Pass in either a class or a function that handles the non-pure bits -- `GPS`. This is called **Inversion of Control**
* When you pass in a class it's called **Dependency Injection** 
    * `is_my_dog_nearby(my_id, dog_id, class_that_gets_current_location)`
* When you pass in a function, the function that takes a function as an argument is a **Higher Order Function**
    * `is_my_dog_nearby(my_id, dog_id, method_to_get_current_location)`

### Better code that uses a Higher Order Function:

```python
def is_my_dog_nearby(my_id, dog_id, method_to_get_current_location):
    # We are no longer tightly coupled with the non-deterministic GPS
    dog_location = method_to_get_current_location(dog_id) 
    my_location = method_to_get_current_location(my_id)

    if distance(my_location, dog_location, 'mi') < 0.2:
       return True
    else: 
        return False

def test_is_my_dog_nearby_returns_true_when_nearby():
    my_id = 123
    dog_id = 456

    # Now we can simulate GPS behavior with our own method. Much easier!
    method_to_get_current_location = lambda id: return Coord(3,4) if id == dog_id else return Coord(0,0)

    result = is_my_dog_nearby(my_id, dog_id, method_to_get_current_location)
    assert result == True
```