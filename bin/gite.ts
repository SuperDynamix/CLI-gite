#!/usr/bin/env node
import { execFileSync } from "child_process";
import path from "path";
import { exit } from "process";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

try {
  execFileSync(path.resolve(`${__dirname}/main`),process.argv.slice(2));
  } catch (e) {
    exit(1)
  }