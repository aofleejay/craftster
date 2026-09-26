dev:
	flutter run \
		--flavor dev \
		-t lib/main_dev.dart \
		--dart-define-from-file=lib/config/dev/env.json

prod:
	flutter run \
	  --flavor prod \
		-t lib/main_prod.dart \
		--dart-define-from-file=lib/config/prod/env.json
