# VoxCPM2: Tokenizer-Free TTS for Multilingual Speech Generation, Creative Voice Design, and True-to-Life Cloning

- Source URL: https://github.com/OpenBMB/VoxCPM
- Source type: GitHub repository overview
- Repository: `OpenBMB/VoxCPM`
- License: Apache-2.0
- Archived on: 2026-04-15

## Preserved overview

VoxCPM is a tokenizer-free text-to-speech system that directly generates continuous speech representations with an end-to-end diffusion autoregressive architecture rather than discrete speech tokenization.

VoxCPM2 is presented as the main release, built on a MiniCPM-4 backbone, with a 2B-parameter model trained on more than 2 million hours of multilingual speech data. The repository states support for 30 languages, voice design from text descriptions, controllable voice cloning, continuation-style high-fidelity cloning, and direct 48kHz audio output.

### Claimed highlights

- 30-language multilingual speech synthesis without explicit language tags
- Voice Design from natural-language voice descriptions without reference audio
- Controllable voice cloning from short reference clips with optional style guidance
- Ultimate cloning using reference audio plus transcript for continuity-style imitation
- 48kHz audio output through AudioVAE V2-based design
- Context-aware prosody and expressiveness
- Real-time streaming support
- Apache-2.0 license and claimed commercial usability

### Supported languages listed in the repository

Arabic, Burmese, Chinese, Danish, Dutch, English, Finnish, French, German, Greek, Hebrew, Hindi, Indonesian, Italian, Japanese, Khmer, Korean, Lao, Malay, Norwegian, Polish, Portuguese, Russian, Spanish, Swahili, Swedish, Tagalog, Thai, Turkish, Vietnamese.

The repository also lists multiple Chinese dialects including Sichuanese, Cantonese, Wu, Northeastern Mandarin, Henan, Shaanxi, Shandong, Tianjin, and Southern Min.

## Project links surfaced in the repository

- Demo space: https://huggingface.co/spaces/OpenBMB/VoxCPM-Demo
- Documentation: https://voxcpm.readthedocs.io/en/latest/
- Hugging Face model: https://huggingface.co/openbmb/VoxCPM2
- ModelScope model: https://modelscope.cn/models/OpenBMB/VoxCPM2
- Demo page: https://openbmb.github.io/voxcpm2-demopage/
- Backbone reference: https://github.com/OpenBMB/MiniCPM
- High-throughput serving companion: https://github.com/a710128/nanovllm-voxcpm

## Quick-start notes preserved from the repo page

Installation snippet shown in the repository:

```bash
pip install voxcpm
```

Requirements mentioned on the page:

- Python >= 3.10 and < 3.13
- PyTorch >= 2.5.0
- CUDA >= 12.0

Basic usage pattern shown in the repository:

```python
from voxcpm import VoxCPM
import soundfile as sf

model = VoxCPM.from_pretrained(
    "openbmb/VoxCPM2",
    load_denoiser=False,
)

wav = model.generate(
    text="VoxCPM2 is the current recommended release for realistic multilingual speech synthesis.",
    cfg_value=2.0,
    inference_timesteps=10,
)
sf.write("demo.wav", wav, model.tts_model.sample_rate)
```

The repository also presents command-line usage patterns for voice design, cloning, batch generation, and a local web demo via `python app.py --port 8808`.

## Version table points preserved from the repository

The repository compares three versions:

- VoxCPM2, marked as latest
- VoxCPM1.5, marked stable
- VoxCPM-0.5B, marked legacy

The table claims, among other things:

- VoxCPM2 uses a 2B backbone
- VoxCPM2 outputs 48kHz audio
- VoxCPM2 supports 30 languages
- VoxCPM2 adds voice design and controllable voice cloning
- VoxCPM2 reports about 8 GB VRAM use
- VoxCPM2 reports RTF around 0.30 on RTX 4090, or around 0.13 with Nano-VLLM

## Architecture note preserved from the repository

The repository describes VoxCPM2 as operating in the latent space of AudioVAE V2 through a four-stage pipeline:

- LocEnc
- TSLM
- RALM
- LocDiT

This is presented as the basis for expressive synthesis and native 48kHz output.

## Preservation note

This archive preserves the repository overview and high-level README claims from the public GitHub page, not the full repository contents, codebase, model weights, or documentation site.
