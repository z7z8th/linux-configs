#!/bin/bash

rake ts:configure
rake ts:stop
rake ts:start

bin/delayed_job start

rails server -b 0.0.0.0


