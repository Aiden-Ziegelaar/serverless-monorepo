init:
	corepack enable
	corepack prepare yarn@stable --activate
	yarn 

typecheck:
	yarn tsc --noEmit

build: clean typecheck
	yarn ts-node tools/build.ts

clean: 
	yarn rimraf dist

format:
	yarn prettier --write .

lint:
	yarn eslint . --max-warnings=0

plan:
	terraform -chdir=infra plan

provision:
	terraform -chdir=infra apply