# videnc

VidEnc 1.0 to 1.2 (2012 - 2013): a Windows batch procedure that encodes every video of an input folder for the web
with HandBrakeCLI (MP4) and ffmpeg (a thumbnail; WebM and Ogg in the first version), with four short guides (install,
configuration, usage, shortcut). A historical archive, kept read-only.

Old scripts: they ran on the systems of their time and are not maintained.

## History

| Date | Commit | |
|---|---|---|
| 2012-04-16 | 879e552 | VidEnc 1.0: `videnc.cmd`, `config.cmd` and the guides |
| 2012-05-03 | 278c28e | VidEnc 1.1: MP4 and the thumbnail only |
| 2013-09-26 | 6c02d87 | VidEnc 1.2: the folders repacked |

## How it was built

From my Subversion repository (r39 to r74), turned into git in 2026 (5 commits), the dates kept. The commits
that only added the release zips or updated the bundled programs are not in this copy, since those files are left out.
The last commit before this README sets LF line endings and keeps the empty folders with a `.gitkeep`.

## Running it

The bundled programs are left out of this public copy (HandBrakeCLI and ffmpeg, 32 and 64 bit, and the release zips that
packed them). To try it, put the Windows builds into `work/videnc/bin/` as `HandBrakeCLI-32.exe`, `HandBrakeCLI-64.exe`,
`ffmpeg-32.exe`, `ffmpeg-64.exe`, then follow the guides in `work/videnc/doc/`. Today's HandBrake no longer has the
`faac` audio encoder that `videnc.cmd` asks for: `-E av_aac` replaces it.

## Licence

MIT (see `LICENSE`), added in 2026: the scripts named no licence.

See also [early-scripts](https://github.com/webservco-legacy/early-scripts), my first scripts.
