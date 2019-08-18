
1. setup your pre-commit yml file

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


2. Add your flake8 config file

```
[flake8]
ignore = E203, E266, E501, W503, F403
max-line-length = 79
max-complexity = 18
select = B,C,E,F,W,T4,B9
```

3. setup your travis-ci service

```
language: python
python:
  - "2.7"
  - "3.6"
# command to install dependencies
install:
  - pip install -r requirements.txt
# command to run tests
script:
  - pytest
```

4. Tips for performing various travis tasks

```
before_script:
  - mock_server.py &
```

5. testing on multiple OS's

```
matrix:
  include:
  - os: linux
    python: '3.6'
    dist: xenial
  - os: linux
    python: '3.7'
    dist: xenial
  - os: osx
    language: generic
```

6. File Structure
```
.
├── README.md
├── my_module
│   ├── __init__.py
│   ├── my_module.py
│   └── tests
│       └── test_module.py
├── requirements.txt
├── setup.py
└── travis_examples
    ├── mock_server_example
    │   └── mock_server.py
    └── script_install_example
        └── travis.yml
```