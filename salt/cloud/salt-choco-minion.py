#!/usr/bin/env python

import sys
import os
import time
import subprocess
import logging
import tempfile

# those flags appeared in newer versions of Python subprocess, but don't assume
DETACHED_PROCESS = 0x00000008
CREATE_NEW_PROCESS_GROUP = 0x00000200

logger = logging.getLogger('test')

if __name__ == '__main__':
    logging_level = logging.INFO
    logging.getLogger().setLevel(logging_level)
    logging.basicConfig()

    if not 'RESPAWN' in os.environ:
        logger.info('Spawning a child: executable: %r, __file__: %r', sys.executable, __file__)
        respawn_logfile = tempfile.NamedTemporaryFile(
            prefix='respawn-',
            suffix='.txt',
            delete=False)
        os.environ['RESPAWN'] = respawn_logfile.name
        logger.info('Will log to temp file: %r', respawn_logfile.name)
        subprocess.Popen(
            args=[sys.executable, __file__],
            executable=sys.executable,
            env=os.environ,
            close_fds=True,
            creationflags=DETACHED_PROCESS | CREATE_NEW_PROCESS_GROUP
        )
        sys.exit(0)

    fh = logging.FileHandler(os.environ['RESPAWN'])
    fh.setLevel(logging_level)
    logging.getLogger().addHandler(fh)

    try:
        logger.info('I am the respawned process. Do what you want.')
        
        # Give enough time to the master to report the result of the parent execution before we nuke
        time.sleep(5)
        
        # NOTE: This next has worked fine running blind in my limited testing,
        # but may want to capture output and check exit codes..

        # Cleanly stop the service
        subprocess.call(['net', 'stop', 'salt-minion'], shell=True)
        subprocess.call(['choco', 'upgrade', 'saltminion'], shell=True)
        # Is only necessary if saltminion was already setup
        # If it got installed above, the service automatically started during the install
        subprocess.call(['net', 'start', 'salt-minion'], shell=True)
        
    except Exception as e:
        logger.error(e)
    finally:
        logger.info('Done with the doing')
