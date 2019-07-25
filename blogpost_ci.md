# Unit Testing, Code Consistency, and Linting in Python: 
### By Will Norris

# Unit Testing: 
## Why is Unit Testing Critical?

Testing your code is never the first thing software engineers think of, but it should be! So often we have an idea to make our workflow easier so we implement it as fast as possible. As long as it gives us the desired output it should be fine right? Wrong!

Code that we sling together often only covers the specific use cases that we were dealing with that day. This means that when you dust off that module you used to process your data last time, it may not work as you expected today.

There are several possible reasons why code works one day and not another day: 

1. Not Truly Understanding What a Function is Meant To Do
2. Edge Cases That Were Not Considered 
3. Updated/Out-of-Date Software or Dependencies 

### **Not Understanding What a Function is Meant To Do**

The proper time to write your unit tests is while you are writing your code. If you want to add a new function to a python library you have created, it makes sense to start by thinking about how you would like it to function and then writing a unit test that checks it works how you expect. You can even write the test that calls your new function before you write the function at all; if you understand how it needs to be used, you will understand how to build it. 

Programmers are always suprised when they get around to finally using their new code only to realize it needs to work differently to actually function as required. When you write unit tests, you force yourself to really consider what, why, and how your code will accomplish the desired outcomes. This process of testing code as you develop it can also help you to reduce technical debt that can accumulate over the course of a project and aid in constructing an application that flows and works cohesively. 

While it may seem tedious to stop and write tests for each function you create in your python package, it will save you immense trouble in the long run; writing unit tests after a program has been developed is far more difficult. Once you have written 500 lines of code, you may not have the best grasp of exactly what each function in that file is supposed to do at the finer detail level. This means that going back to write your unit tests is going to require you to go step by step through your code, which can be more difficult after you have built a lof of infrastructure around it. As mentioned above, writing you unit tests will help shape the finer details of how each function works; this means if you leave testing to the last minute, you may find yourself doing larger overhauls than originally expected. 

### **Edge Cases That Were Not Considered**

As you write the function, think about different inputs that could cause edge cases. Ask yourself how will you handle these edge cases, and write a unit test for each one that makes sure they are covered.

If you ever come upon another edge case when using your code, figure out how to solve it, then write a unit test for it. If you cannot solve this issue immediatley, open an issue in the GitHub repo for the code to remind yourself to come back later and fix the issue. 

In addition to testing your own code, if you ever find yourself fixing an edge case for another repository that is owned by someone else, it is best practice to write a unit test to go along with the pull request. Adding a unit test gives the repositories owner a clear sense for what use case(s) you are attempting to fix and the method you went about it. 

### **Updated/Out-of-Date Software or Dependencies**

One of the most common reasons that python code works one day and doesn't the next is due to the complex dependency system that python employs. It is not at all uncommon for one of your dependencies to be updated and either alter the way you must make use of their functionality or remove it completely; occasionally updates simply break things too, and get fixed in time. If you have a robust unit testing system in place you can normally pinpoint which dependency is causing your issues, which can save massive amounts of time troubleshooting!

# Linting

As programmers, we write and read code every day. It helps if that code is consistent and similar from file to file or programmer to programmer. This means that we must embrace some form of standards when it comes to formatting our code. Some programming languages have built in formatters and standards (Go), but others follow community agreed standards (python). If you have spent some time programming in python, then you probably have heard of PEP8, which is the standard style guide that the python community agreed to follow many years ago. 

The interesting thing about PEP8 though is that it is just a guide. Golang has a built in tool for enforcing its formatting standards, but python simply has a set of guidelines for programmers to follow. This leads to inconsistent formatting of code from person to person, and can impact the readability of files when sharing open science. 

The automatic tool that GoLang has access to, '''gofmt''', is called a Linting service. This service takes your files, and checks them for style/formatting issues. This ultimately leads to everyone's files being formatted in the same manner. 

Python doesn't have an automatic tool like this built in, but in true python fashion it does have access to some great 3rd party libraries for performing this task. 

Our first useful tool is ```flake8```, which finds style errors and reads out where they are comming from for you. However, flake8 does not fix any of these formatting issues. It just tells you where they are. 

This is where a tool called ```black``` comes in. ```black``` isn't a part of the standard python library, and therefore doesn't adhere 100% to PEP8 standards; however, it does do a phenominal job at cleaning your code into a format that is easy to read. ```black``` actually contains a few extra rules on top of PEP8 standards that its team claim make it even better for maintainable code, which is critical to python programmers. 



# 1. Our Toolbox
- Testing Tools
    - Pytest 
    - Codecov
- Linting Services
    - black 
- Continuous Integration
    - Travis-CI