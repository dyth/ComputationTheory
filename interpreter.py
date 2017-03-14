#!/usr/bin/env python
"""python interpreter for a register machine"""
import csv, sys, re


def readFile(name):
    'return string read from file name'
    name = open(name, 'r')
    lines = name.read()
    name.close()
    return lines


def toIntList(line):
    'convert string into int list'
    rule = []
    line = line.split(',')
    rule = [int(l) for l in line]
    return rule


def tokenize(lines):
    'tokenize lines'
    # remove layout characters
    lines = lines.replace(' ', '')
    lines = lines.replace('\n', '')
    # remove comments
    lines = re.sub("/.*/", '', lines)
    # split into lines and remove last null string
    lines = lines.split(';')
    lines = lines[:-1]
    # convert strings into an integer format
    lines = [toIntList(l) for l in lines]
    return lines


def parse(tokens):
    'parse tokens and return list of rules'
    tokens = tokens[1:]
    # sort rules by first element, such that they are indexed
    # by list position rather than by first index
    tokens = sorted(tokens)
    rules = [t[1:] for t in tokens]
    return rules


def rule0(rule, configuration):
    'operates rule1 on configuration'
    # increment and then move to instruction pointed by rule[1]
    configuration[1] += 1
    configuration[0] = rule[1]
    return configuration


def rule1(rule, configuration):
    'operates rule2 on configuration'
    # if greater than zero, decrement and then move to
    # instruction pointed by rule[1], otherwise move to
    # intruction pointed by rule[2]
    index = rule[0] + 1
    if (configuration[index] > 0):
        configuration[index] -= 1
        configuration[0] = rule[1]
    else:
        configuration[0] = rule[2]
    return configuration


def compute(rule, configuration):
    'do a computation'
    # length of rule changes action of which rule to apply
    length = len(rule)
    if (length == 2):
        configuration = rule0(rule, configuration)
    elif (length == 3):
        configuration = rule1(rule, configuration)
    else:
        configuration = "HALT"
    return configuration


# parse rules and starting configuration from file
name = str(sys.argv[1])
lines = readFile(name)
tokens = tokenize(lines)
rules = parse(tokens)
# starting configuration is given by first entry in list
configuration = tokens[0]

# while there is still a computation, do it
while (configuration != "HALT"):
    print configuration
    number = configuration[0]
    rule = rules[number]
    configuration = compute(rule, configuration)
