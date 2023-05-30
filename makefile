init:
	corepack enable
	corepack prepare yarn@stable --activate
	yarn 

typecheck:
	yarn tsc --noEmit

build: clean
	yarn ts-node tools/build.ts

clean: 
	yarn rimraf dist

plan:
	terraform -chdir=infra plan

provision:
	terraform -chdir=infra apply