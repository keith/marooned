#!/usr/bin/env bash

bundle exec rake gems:vendorize && bundle exec rake release
