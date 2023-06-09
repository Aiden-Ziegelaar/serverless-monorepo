import * as fs from "node:fs/promises";
import * as esbuild from "esbuild";

const main = async () => {
  const functionSources = await fs.readdir(`${process.cwd()}/functions`);
  const entrypoints = functionSources.map(
    (source) => `${process.cwd()}/functions/${source}/index.ts`
  );
  await esbuild.build({
    entryPoints: entrypoints,
    bundle: true,
    outdir: "dist",
    sourcemap: true,
    platform: "node",
  });
};

main();
