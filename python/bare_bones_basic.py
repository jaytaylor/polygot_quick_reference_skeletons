#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

def main(args):
    """
    :param: args containing command-line arguments.

    :return: int containing desired exit status code.
    """
    try:
        print('hi from %s' % (__name__,))
    except BaseException as e:
        print('ERROR: %s' % (e,))
        return 1
    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))

