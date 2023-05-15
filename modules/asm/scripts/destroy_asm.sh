#!/usr/bin/env bash

# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
kubectl label namespaces --all istio.io/rev-
kubectl label namespaces --all istio-injection-
kubectl delete controlplanerevision --all -n istio-system
kubectl delete validatingwebhookconfiguration,mutatingwebhookconfiguration -l operator.istio.io/component=Pilot
kubectl delete ns asm-system istio-system --ignore-not-found=true
kubectl label namespaces --all istio-injection-
