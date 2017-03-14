#!/usr/bin/env python
"""python interpreter for a register machine"""
import csv
# instruction number, register number, instructions to register


def toList(line):
    'string into integer list'
    rule = []
    line = line.split(',')
    for item in line:
        rule.append(int(item))
    return rule


def rule0(rule, configuration):
    'operates rule1 on configuration'
    configuration[1] += 1
    configuration[0] = rule[1]
    return configuration


def rule1(rule, configuration):
    'operates rule2 on configuration'
    if (configuration[rule[0]+1] > 0):
        configuration[rule[0]+1] -= 1
        configuration[0] = rule[1]
    else:
        configuration[0] = rule[2]
    return configuration


configuration, rules = None, []

openfile = open('register').read().replace(" ", "").split('\n')
for line in openfile:
    if ('*' not in line) and (line != ""):
            if (configuration == None):
                configuration = toList(line)
            else:
                rules.append(toList(line)[1:])


while True:
    print configuration
    number = configuration[0]
    if (len(rules[number]) == 3):
        configuration = rule1(rules[number], configuration)
    elif (len(rules[number]) == 2):
        configuration = rule0(rules[number], configuration)
    else:
        print "HALT"
        break
