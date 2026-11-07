run-dev:
	fvm flutter run \
		--flavor dev \
		-t lib/main_dev.dart \
		--dart-define-from-file=lib/config/dev/env.json

run-prod:
	fvm flutter run \
	  --flavor prod \
		-t lib/main_prod.dart \
		--dart-define-from-file=lib/config/prod/env.json

build-apk-e2e:
	fvm flutter build apk --debug --flavor dev -t lib/main_e2e.dart --dart-define-from-file=lib/config/dev/env.json
build-apk-dev-release:
	fvm flutter build apk --flavor dev -t lib/main_dev.dart --dart-define-from-file=lib/config/dev/env.json
build-apk-prod-release:
	fvm flutter build apk --flavor prod -t lib/main_prod.dart --dart-define-from-file=lib/config/prod/env.json
build-appbundle-prod-release:
	fvm flutter build appbundle --flavor prod -t lib/main_prod.dart --dart-define-from-file=lib/config/prod/env.json
