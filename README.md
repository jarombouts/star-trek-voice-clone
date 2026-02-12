# Star Trek Computer Voice for Claude Code

Give your AI coding assistant the voice of a Starfleet computer. Audible notifications through macOS speakers using ElevenLabs TTS and a cloned LCARS voice.

## What this does

Claude Code speaks to you out loud — task completions, errors, nudges — in the dry, mildly sarcastic tone of a federation computer that's seen too many warp core breaches.

## Demo

<video src="unable to comply.mov" controls autoplay muted></video>

> "Build complete. All tests passing. You're welcome."

> "Unable to comply. Test suite has failed. Again."

> "Warning. Your test suite is a mess."

## Setup

### 1. Clone a Star Trek computer voice on ElevenLabs

Upload the sample MP3 files from this repo as training data for an [ElevenLabs Instant Voice Clone](https://elevenlabs.io/voice-cloning). The files are grouped into chunks under the 10MB upload limit:

- `group_1.mp3` through `group_9.mp3`

Upload a few of these when creating your voice clone. More samples = better quality.

### 2. Set up the script

```bash
cp speak.sh ~/speak.sh
chmod +x ~/speak.sh
```

Set your environment variables:

```bash
export ELEVENLABS_API_KEY="your_api_key_here"
export ELEVENLABS_VOICE_ID="your_cloned_voice_id_here"
```

Test it:

```bash
~/speak.sh "Warning. Hull breach on deck seven. That is going to leave a mark."
```

### 3. Install the Claude Code skill

Copy the skill into your Claude Code skills directory:

```bash
mkdir -p ~/.claude/skills/speak
cp SKILL.md ~/.claude/skills/speak/SKILL.md
```

Now you can use `/speak` as a slash command inside Claude Code:

```
/speak Compilation complete. Zero warnings. Unprecedented.
```

### 4. Enable automatic notifications

Add the contents of `CLAUDE.md` to your `~/.claude/CLAUDE.md` to have Claude proactively notify you when tasks complete or need attention.

## Requirements

- macOS (uses `afplay` for audio playback)
- [ElevenLabs](https://elevenlabs.io) API key
- python3, curl
- Claude Code

## License

Audio files were grabbed off https://www.trekcore.com/audio/, if it wasn't for their hard work this wouldn't have been so easy.

There is obviously the question of legality and ownership. 

Do whatever you want with this. Keep it personal and non-commercial. Starfleet Command is not liable for any resulting productivity loss.
