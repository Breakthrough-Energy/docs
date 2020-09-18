PRs are critical to good software development. They reduce code defects by 80-90% [1]. They help keep the team up to date with new code in the code base and they let us teach each other how to get better at coding. 

It can be tough as the code owner to hear criticism. It can also be hard for the reviewer to tell a teammate their work is not perfect. We're going to go over team practices around code reviews, how to give a good code review, and how to make code reviews less stressful for everyone.

# Cheat Sheet

* Work together if the review is complex, is taking a long time, or if there are many rounds of feedback
  * Leave a comment to summarize
* **Keep branch up to date with develop** with `git fetch` and `git rebase origin/develop`
* Keep code documentation up to date in the README
* Run pep8, run pytest at top level directory, update requirements.txt, and remove dead code
* Add at least one main reviewer and notify reviewer via alternative channel
* Reviewer is expected to submit first round of feedback within two days
  * Let the code owner know if you're too busy
* Reviewer should not ask the code owner to change code they didn't touch
* The code owner is responsible for doing the final squash / merge and deleting the branch

![github screenshot](https://cleanenergy.blob.core.windows.net/misc/example_pr_cheatsheet_1.png)
![github screenshot](https://cleanenergy.blob.core.windows.net/misc/example_pr_cheatsheet_2.png)

# Code Owner
### Before writing code: 
  * If it is a complicated change, review your design with a teammate in person
  * This helps avoid big changes in the review
### Before review: 
  * Run pep8 for python, code linter for javascript
    * This can be done [automatically in pycharm](https://github.com/hscgavin/autopep8-on-pycharm)
  * Check if your documentation is good and code is readable
  * Check if you have enough tests
  * Check if all tests pass: run `pytest` at the top level directory
  * Do a manual sanity check of the entire feature
  * If you have added new libraries, sure requirements.txt has been updated
  * Remove dead code and unnecessary print statements
  * Get updates from develop branch: run `git fetch` then `git rebase origin/develop`
### Making the PR:
  * Try to keep your PRs simple - less than 400 lines
    * Short PRs get reviewed faster, get better feedback, and more bugs are caught
  * Write a short summary of the purpose of the code feature
  * Describe what the code is doing
    * If it's hard to tell what code is new (moved files, pep8) tell the reviewer where to look
  * If your changes produce visuals like graphs or UI make sure to include screenshots
  * If you are working on front end code it's nice to include a link to a working instance of your code
  * Give an estimate of how quick the PR should be, whether it's blocking a task, and if it's urgent
    * If it's super urgent contact the reviewer directly
  * Set yourself and the main reviewer as the PR assignees
### Who to add:
  * [List of team areas of expertise](https://github.com/intvenlab/REISE/wiki/Team-Knowledge-(who-to-assign-PRs-to%3F))
  * Set at least one person as the main PR reviewer by adding them as an assignee
    * **Be considerate of whether that person is busy**
    * Do they have a lot of critical tasks right now?
    * Do they have a lot of big PRs assigned to them already?
  * Feel free to add any other people you think should see the code

### If your PR is complicated or it is taking a long time to get feedback:
Offer to work together with the reviewer!
* Explain what your code is doing
* Discuss differences in opinion
* Post a follow up comment in the PR summarizing what you talked about

![some good boys at boston dynamics](https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2018/02/ezgif.com-optimize.gif)

*Teamwork*

### Afterwards:
* When you do get good / helpful comments, it's nice to occasionally thank the reviewer!
* The code owner is responsible for doing the final merge / deleting the branch
* Squash any tiny commits locally: run `git rebase -i HEAD~<number of commits>`
* Get updates from develop branch: run `git fetch` then `git rebase origin/develop`
* Merging options:
  * `rebase and merge` when you have only one commit
  * `squash and merge` when your PR is for a very small feature or a chore update
  * `merge branch` when you are working on a larger feature. Please remember to squash tiny commits first.
* Remember to delete the branch after merging

# Reviewer
Ideally code reviews should be lightweight and focus on minor things like style, docs, bugs, and adding tests.

[Studies show](https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/) that most people do their best review work when their review speed is less than 300 - 500 lines of code per hour. Additionally, do not review for more than 60 minutes at a time.

### Respect the code owner's time
Problems Include: 
* Taking a long time to finish a review
  * Give comments ASAP, **within two days** of being asked to review
  * If you are too busy to review code right now, please let the code owner know so they can ask someone else if necessary
* Asking for a lot of big changes
  * Choose which improvement avenues to focus on - don't expect perfection
  * If many big changes are needed, try to work in person
* Asking the code owner to change code they didn't touch
  * It sounds nice to fix things as you go but it can cause PRs to drag on and balloon in scope
  * Instead, log an issue in the repo that can be addressed in a separate PR. Decide who is responsible.

## What to review [2]

1. Does the code do what is required?
2. Does it process edge cases / corner cases correctly?
3. Does it have unintended side-effects?
4. Does it handle exceptions well?
5. Is it easy to understand?
6. Is it easy to maintain and extend (this means good design)?
7. Does it have enough unit tests?
8. Does it conform to coding standards (formatting, naming convention, documentation/comments etc)?

![review value vs conflict](https://cleanenergyteststore.blob.core.windows.net/test-blob/review%20value%20vs%20conflict.jpg)

*Some feedback is more valuable than others, but also more likely to cause disagreements*

## Leaving good feedback

Code reviews can be stressful. It's tough to hear that you did something wrong, it's tough to give negative feedback, and sometimes it can be tough to come to an agreement when there's a difference of opinion. If you're highly critical in code reviews or don't take feedback well, your relationship with your teammates will suffer. Stress takes away energy we could be using to get other stuff done. Therefore, we want to make the code review process as smooth and easy as possible.

![Code Quality 3 from https://www.xkcd.com/1833/](https://cleanenergyteststore.blob.core.windows.net/test-blob/code_quality_3.png)

*Some rough feedback*

### Guidelines [3]

There are a few well-known guidelines when giving feedback:

1. Never use the word “you”. Comments can always be rephrased with “we” as the subject, or in a neutral way with the code as the subject. For example,

```
  a) “You need a unit test for this” 
     -> “We should unit test this”
  b) “Why did you do it this way?” 
     -> “What are the advantages of this approach?”
```

2. Phrase things as questions; as well as sounding friendlier, you may actually be wrong in your first impression. So 

```
  a) “We already have a function x that does this” 
    -> “How does this functionality differ from function x?”
    -> or: “Can we re-use x here?”
  b) "We should use a csv here"
    -> "Is there a reason we're not using a csv here?"
```

3. If you're suggesting a code change or a have a quick tip, try to include a snippet of code or pseudo-code.
```
  "I think we can use format strings here -- they're much easier to read!"
      print(f'Completed download of {fileName}.')
```

4. A large volume of comments, even if each is sensitively phrased, can feel like an attack on the author. Prioritize essential comments, and accept passable code even if it isn’t perfect. Raising code quality is a process that happens over time through training and mentoring; it can’t happen through code review alone. One idea by Michael Lynch is to try to raise code quality by no more than one or two letter grades:

```
  “I privately think of the code in terms of letter grades, from A to F. 
  When I receive a changelist that starts at a D, I try to help the author 
  bring it to a C or a B-. Not perfect, but good enough.”
```

5. And finally, make positive as well as constructively critical comments on a code review. It’s generally very easy to find something positive to say, for example:

```
  “This is a neat library you found”
  “I didn’t know this function existed, thanks for bringing it to my attention”
  “This is really easy to follow, thanks!”
  “Test coverage looks really comprehensive”
```

  At the very least, you can always say thank you to the author for their hard work!

# Everyone

* Stay positive, friendly, and laid back
* Be explicit. Remember people don't always understand your intentions online
* Avoid selective ownership of code. "mine", "not mine", "yours"
* Try not to take feedback personally
* Try to see things from the other person's point of view
* If a review seems aggressive or angry or otherwise personal, consider if it is intended to be read that way and ask the person for clarification of intent, in person if possible.
* Remember everyone is doing their best
* Consider how the historical context of the code affects what's being written now
* Communicate early and often
* Work together if the review is complex, is taking a long time, or if there are many rounds of feedback

One final note:
Defects found in peer review are not an acceptable rubric by which to evaluate team members. Reports pulled from peer code reviews should never be used in performance reports. If personal metrics become a basis for compensation or promotion, developers will become hostile toward the process and naturally focus on improving personal metrics rather than writing better overall code.[4]

### References
1. https://blog.codinghorror.com/code-reviews-just-do-it/
2. https://www.quora.com/As-a-senior-developer-how-do-you-review-the-code-of-the-junior-developers
3. https://www.alexandra-hill.com/2018/06/25/the-art-of-giving-and-receiving-code-reviews/
4. https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/

### Further reading
[Google: How to do a code review](https://google.github.io/eng-practices/review/reviewer/)

[Google: The CL author’s guide to getting through code review](https://google.github.io/eng-practices/review/developer/)
