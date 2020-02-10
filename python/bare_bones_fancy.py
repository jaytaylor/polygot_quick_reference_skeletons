#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""bare_bones_fancy.py - Solves the problem nicely!"""

import argparse
import logging
import sys

# Module-level logger.
logging.basicConfig(format='%(asctime)s %(levelname)-8s %(message)s [%(filename)s:%(lineno)d]', datefmt='%Y-%m-%dT%H:%M:%S%z')
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

def parse_flags(args):
    """
    Parse command-line arguments.

    :param args: List of command-line arguments to parse.

    :return: object containing argparse result.
    """
    # n.b. Description is automatically pulled from module top docstring comment.
    parser = argparse.ArgumentParser(description=__doc__, argument_default=False)
    parser.add_argument('-q', '--quiet', help='Reduce log output to only display errors.', action='store_true')
    parser.add_argument('-v', '--verbose', help='Activate verbose logging output for debugging.', action='store_true')
    flags = parser.parse_args(args)

    if flags.quiet and flags.verbose:
        raise Exception('Invalid flag combination, select one of -q/--quiet, -v/--verbose')
    elif flags.quiet:
        logger.setLevel(logging.ERROR)
    elif flags.verbose:
        logger.setLevel(logging.DEBUG)

    return flags

def main(args):
    """
    :param: args containing command-line arguments.

    :return: int containing desired exit status code.
    """
    try:
        flags = parse_flags(args)

        logger.info('hi from %s', __name__)
    except BaseException:
        logging.exception('Caught exception in main')
        return 1
    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
