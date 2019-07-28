# How Unit Testing, Linting, and Continuous Integration in Python Can Help Improve Open Science
### By Will Norris

- alternate titles: 
    - How Proper Unit Testing and Linting can Help Make Your Open Source Software More Accessible
        - the idea here is that unit testing and linting can really help make code last longer and be used by more people 
        - it forces you to think about how users will be able to access your tools 

# Introduction

Packaging up python software that has helped improve you or your team's workflow can be very beneficial to the greater python community; making your software more robust can also improve your ability to use it in house. However, without the proper infrastructure in place, your python package will either likely break over time or be too difficult for other users to use it efficiently. 

In order to make your software work in the long haul and to a broader group of users it is important to consider what it is meant to do, whether it achieves that goal, and if the code will be maintainable into the future. These three requirements can be addressed via three tools: unit testing, linting, and continuous integration. With these three tools you can ensure that your python packages will function into the future, and are well positioned to have new users use them or build upon them. 


# Unit Testing: 
## Why is Unit Testing Critical?

Testing your code is never the first thing software engineers think of, but it should be! So often we have an idea to make our workflow easier so we implement it as fast as possible. As long as it gives us the desired output it should be fine right?

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

## Tools for Unit Testing: 

In python today, pytest is generally the easiest and most pythonic way to test your code. It is easy to learn how to use, but contains a lot of customizability as your project expands and your testing demands change. Pytest is also easy to integrate into Travis-CI, which we will discuss further down. 

**Add info about pytest, either here or an example in appendix or something**

# Linting

As programmers, we write and read code every day. It helps if that code is consistent and similar from file to file or programmer to programmer. The more consistent the code, the faster someone can look past the syntax to see what is actually going on. When code is inconsistent, we have to spend time deciphering syntax before we actually get to the core of the functionality. In order to achieve consistent syntax we must embrace some form of standards when it comes to formatting. Some programming languages have built in formatters and standards (Go), but others follow community agreed standards (python). If you have spent some time programming in python, then you probably have heard of PEP8, which is the standard style guide that the python community agreed to follow many years ago. 

The interesting thing about PEP8 though is that it is just a guide. Go has a built in tool for enforcing its formatting standards, but python simply has a set of guidelines for programmers to follow. This leads to inconsistent formatting of code from person to person, and can impact the readability of files when sharing open science. 

The automatic tool that Go has access to, ```gofmt```, is called a linting service. This service takes your files and checks them for style/formatting issues. It then handles any issues found and returns a fixed file. This ultimately leads to everyone's files being formatted in the same manner. 

Python doesn't have an automatic tool like this built in, but in true python fashion it does have access to some great 3rd party libraries for performing this task.

Our first useful tool is ```flake8```, which finds style errors and reads out where they are comming from for you. However, flake8 does not fix any of these formatting issues. It just tells you where they are. You will probably end up using flake8 manually for some things, but there are better ways to address the bulk of the issues that will come up.

This is where a tool called ```black``` comes in. ```black``` isn't a part of the standard python library and doesn't adhere 100% to PEP8 standards; however, it does do a phenominal job at cleaning your code into a format that is easy to read and maintain. ```black``` actually contains a few extra rules on top of PEP8 standards that its team claim make it even better for producing maintainable code, which is critical to python programmers; maintaining python libraries can be one of the most difficult long term challenges a programmer faces. Luckily the tools we will discuss next will further aid in keeping your projects maintained over time.

# Continuous Integration

__Note:__ I will be using Travis-CI as my example CI service because it is easy/free to integrate with public github repositories and is very flexible with its use. 

Continuous integration is likely the most important tool for enabling the creation of maintainable code. With a continuous integration (CI) service, like Travis-CI, every time you push a new version of your code its unit tests gets run in a fresh vm instance with the dependencies of your choosing. 

This means that every time you make a change to your codebase you can automatically run all of your unit tests in a fresh environment to make sure no adverse affects occured. 

You can also choose to run your continuous integration over specific intervals of time to ensure changes to your dependencies haven't broken what you are using them for. If something does break, you can go look at which test is broken and figure out what changes have lead to this occuring. 

CI services aren't just useful for running tests, they also provide the ability to deploy code. For example, every time a tagged commit is created in my git repo, a command is triggered to publish a new pypi version of my software. There are many different "hooks" you can add that get triggered when certain build conditions are met. 

# Our Toolbox

Now that we've discussed why testing and formatting are both critical to the process of creating reliable python code let's dig into the tools we have to implement them. 

## 1. Testing Tools
- ```pytest``` 

    Pytest is a very easy to use and pythonic testing library for python projects. It can be easily installed into a pip or conda environment, and requires very little extra code to start working. 

    Is is also very flexible and can handle most testing requirments you could need. 

- ```codecov```

    Codecov, which stands for "code coverage", is a framework that keeps track of the percentage of lines of your code that are executed by your unit tests. This helps give you an understanding of where you are testing and most importantly where your testing is lacking. It is easy to install and pairs well with pytest, so using it is a no brainer! 

## 2. Linting Tools
- ```flake8```
- ```black```
- ```pre-commit```

    We have already discussed why ```flake8``` and ```black``` are so great for us pythonistas. So here we will dive right into how to set them up in your project. 

    Since we want to run ```flake8``` and ```black``` each time we commit new code, we will take advantage of another framework called ```pre-commit```, which allows us to specify an array of different tasks that we want performed any time we try to commit new code; if the tasks pass, then we can commit, if they fail then we must address them before committing. 

    In order to use ```pre-commit``` we simply need to create a ```.pre-commit-config.yaml``` file. An example that triggers ```black``` and ```flake8``` can be seen below.

```
repos:
-   repo: https://github.com/ambv/black
    rev: stable
    hooks:
    - id: black
      language_version: python3.6
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v1.2.3
    hooks:
    - id: flake8
```



## 3. Continuous Integration Tools
- ```Travis-CI```

Travis-CI is my favorite CI service to teach to programmers who work with open source software because it is very well built, free for open source projects, and easy to learn how to use while still having a high ceiling of potential customization. You can run the most basic pytest testing suite in Travis or you can build software in multiple OS's and automatically deploy your code to several sources when it's done. 


Notes to add: 
- Do i want to discuss how to weave it all together. 
    - Setup your repo so that each commit goes through flake8 and black
    - Then push to a CI service, which runs your unit tests via pytest 
- Probably want that in a repo
