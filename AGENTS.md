# Agent Reference

For general project information, background, and detailed tool descriptions, see [README.md](README.md).

## Quick Reference

* File types: `*.uc` (authorable Usecode C), `*.ucxt` (extracted low-level Usecode C), `*.uca` (Usecode assembly).
* Key tools: `ucc` (Usecode C compiler), `ucxt` (extract/decompile usecode), `wuc` (Usecode assembler).
* Main targets: `make fov` / `make ss` build compiled binaries and extracted `.new.ucxt`; `make check.fov` / `make check.ss` compare against refs; `make ref` regenerates reference `.ref.ucxt` (rarely needed). `make` is equivalent to `make fov ss check.fov check.ss`.
* Important dirs: `fov/`, `ss/` contain in-progress higher-level conversions plus includes; `ucxt/` stores extracted originals; `uca/` holds assembly dumps (notably SIES with debug opcodes).
* Syntax docs: see [usecode-syntax.ebnf](usecode-syntax.ebnf) (EBNF) and [usecode-syntax.yy](usecode-syntax.yy) (simplified Bison); intrinsics reference: [exult_intrinsics.txt](exult_intrinsics.txt).

## Build / Compile Pipeline

* Authoring: edit `fov/` or `ss/` `usecode.uc` plus their `include/*.uc`.
* New build: `make fov` or `make ss` runs `ucc` → `usecode.<game>.new.bin`, then `ucxt` → `usecode.<game>.new.ucxt`.
* Original rebuild: same `make fov`/`ss` also compiles `ucxt/usecode.<game>.ucxt` via `ucc` → `usecode.<game>.orig.bin`, then `ucxt` → `usecode.<game>.orig.ucxt`.
* References: `make ref` copies `usecode.<game>.new.ucxt` to `usecode.<game>.ref.ucxt` (only when you intend to update golden outputs).
* Checks: `make check.fov` / `make check.ss` diff `usecode.<game>.new.ucxt` against `usecode.<game>.ref.ucxt`; `make check` runs both.
* Cleanup: `make clean` removes built bins/ucxt; `make all_clean` also drops ref ucxts.

## File Dependency Graph

* FOV sources: [fov/usecode.uc](fov/usecode.uc#L1-L8) includes [fov/include/constants.uc](fov/include/constants.uc), [fov/include/globals.uc](fov/include/globals.uc), [fov/include/npcs.uc](fov/include/npcs.uc), [fov/include/shapes.uc](fov/include/shapes.uc), [fov/include/structs.uc](fov/include/structs.uc), [fov/include/npc_func.uc](fov/include/npc_func.uc), [fov/include/utils.uc](fov/include/utils.uc).
* SS sources: [ss/usecode.uc](ss/usecode.uc#L1-L9) includes [ss/include/constants.uc](ss/include/constants.uc), [ss/include/globals.uc](ss/include/globals.uc), [ss/include/npcs.uc](ss/include/npcs.uc), [ss/include/structs.uc](ss/include/structs.uc), [ss/include/shape_func.uc](ss/include/shape_func.uc), [ss/include/npc_func.uc](ss/include/npc_func.uc), [ss/include/obj_func.uc](ss/include/obj_func.uc), [ss/include/utils.uc](ss/include/utils.uc).
* Build products: `usecode.<game>.new.bin` depends on the game `usecode.uc` plus all `include/*.uc`; `usecode.<game>.orig.bin` compiles [ucxt/usecode.<game>.ucxt](ucxt/usecode.<game>.ucxt) with the same include dir; `usecode.<game>.ucxt` is emitted from each `.bin` by `ucxt`.
* Checks/refs: `usecode.<game>.ref.ucxt` copies from `.new.ucxt` (via `make ref`) and is compared in `make check` targets.

## Makefile Targets

* [make (default)](Makefile#L14-L25): runs `fov`, `ss`, then `check` (all builds plus checks).
* [fov](Makefile#L14-L25): builds `usecode.fov.new.bin`, `usecode.fov.orig.bin`, and extracts `.new.ucxt`/`.orig.ucxt`.
* [ss](Makefile#L14-L25): builds `usecode.ss.new.bin`, `usecode.ss.orig.bin`, and extracts `.new.ucxt`/`.orig.ucxt`.
* [check.fov / check.ss](Makefile#L42-L54): diff `usecode.<game>.new.ucxt` against `usecode.<game>.ref.ucxt`; `check` runs both.
* [ref](Makefile#L40-L40): copy `usecode.<game>.new.ucxt` → `usecode.<game>.ref.ucxt` (updates goldens).
* [clean](Makefile#L30-L34): remove generated `.bin` and `.ucxt` (keeps refs).
* [all_clean](Makefile#L27-L28): `clean` plus remove reference `.ref.ucxt` files.
* [help](Makefile#L16-L25): prints target summaries.

## Tool Paths and Versions

The [Makefile](Makefile#L1-L2) locates tools dynamically via `readlink -f $(command -v <tool_name>)`:

* `ucc`: Usecode C compiler (resolved from `$PATH`)
* `ucxt`: Usecode eXtractor Tool (resolved from `$PATH`)
* `wuc`: Usecode assembler (used externally; not in Makefile)

**⚠️ Version Requirement**: Only the newest versions are guaranteed to work. Tools are continuously updated with new features to reproduce original usecode as faithfully as possible. If builds fail, ensure you have the latest versions of `ucc`, `ucxt`, and `wuc` from the Exult project. Older versions may lack syntax changes/code generation needed for accurate compilation/decompilation.
