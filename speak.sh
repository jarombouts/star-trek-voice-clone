#!/bin/bash
# Star Trek Computer Voice - ElevenLabs TTS
# Usage: ./speak.sh Your message here
#
# Requires:
#   - ELEVENLABS_API_KEY env var (or replace below)
#   - ELEVENLABS_VOICE_ID env var (or replace below)
#   - python3, curl, afplay (macOS)

API_KEY="${ELEVENLABS_API_KEY:?Set ELEVENLABS_API_KEY}"
VOICE_ID="${ELEVENLABS_VOICE_ID:?Set ELEVENLABS_VOICE_ID}"
TEXT="$*"

JSON=$(python3 -c 'import json,sys; print(json.dumps({"text": sys.argv[1], "model_id": "eleven_multilingual_v2", "voice_settings": {"stability": 1.0, "similarity_boost": 0.9, "style": 0.5, "use_speaker_boost": True, "speed": 0.8}}))' "$TEXT")
curl -s -X POST "https://api.elevenlabs.io/v1/text-to-speech/${VOICE_ID}?output_format=mp3_44100_128" \
  -H "Content-Type: application/json" \
  -H "xi-api-key: ${API_KEY}" \
  -d "$JSON" \
  -o /tmp/speak_output.mp3 && afplay /tmp/speak_output.mp3 --volume 0.4
