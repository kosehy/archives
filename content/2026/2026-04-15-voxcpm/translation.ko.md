# VoxCPM2: 다국어 음성 생성, 창의적 음성 설계, 실제감 있는 클로닝을 위한 토크나이저-프리 TTS

- 원문 URL: https://github.com/OpenBMB/VoxCPM
- 원문 유형: GitHub 저장소 개요
- 저장소: `OpenBMB/VoxCPM`
- 라이선스: Apache-2.0
- 아카이브 일자: 2026-04-15

## 보존한 개요

VoxCPM은 이산 음성 토큰화를 거치지 않고 연속적인 음성 표현을 직접 생성하는 토크나이저-프리 TTS 시스템으로 소개됩니다. 저장소 설명에 따르면, 종단간 diffusion autoregressive 구조를 사용해 보다 자연스럽고 표현력 있는 음성 합성을 목표로 합니다.

VoxCPM2는 이 저장소의 주력 릴리스로 제시되며, MiniCPM-4 백본 위에 구축된 2B 파라미터 모델입니다. 저장소 페이지는 200만 시간 이상의 다국어 음성 데이터로 학습되었다고 설명하며, 30개 언어 지원, 텍스트 설명 기반 Voice Design, 제어 가능한 음성 클로닝, 연속형 고충실도 클로닝, 48kHz 오디오 출력을 핵심 특징으로 내세웁니다.

### 저장소가 강조하는 특징

- 언어 태그 없이 30개 언어를 직접 합성하는 다국어 TTS
- 참조 오디오 없이 자연어 설명만으로 새 목소리를 만드는 Voice Design
- 짧은 참조 음성에 스타일 지시를 더할 수 있는 제어형 음성 클로닝
- 참조 음성과 전사문을 함께 사용해 연속성을 살리는 고충실도 클로닝
- AudioVAE V2 기반 설계를 통한 48kHz 출력
- 텍스트 맥락에 따른 운율과 표현 자동 반영
- 실시간 스트리밍 지원
- Apache-2.0 라이선스와 상업적 사용 가능 주장

### 저장소에 적힌 지원 언어

Arabic, Burmese, Chinese, Danish, Dutch, English, Finnish, French, German, Greek, Hebrew, Hindi, Indonesian, Italian, Japanese, Khmer, Korean, Lao, Malay, Norwegian, Polish, Portuguese, Russian, Spanish, Swahili, Swedish, Tagalog, Thai, Turkish, Vietnamese.

중국어 방언으로는 四川话, 粤语, 吴语, 东北话, 河南话, 陕西话, 山东话, 天津话, 闽南话도 함께 표기돼 있습니다.

## 저장소 페이지에서 확인한 관련 링크

- 데모 스페이스: https://huggingface.co/spaces/OpenBMB/VoxCPM-Demo
- 문서: https://voxcpm.readthedocs.io/en/latest/
- Hugging Face 모델: https://huggingface.co/openbmb/VoxCPM2
- ModelScope 모델: https://modelscope.cn/models/OpenBMB/VoxCPM2
- 데모 페이지: https://openbmb.github.io/voxcpm2-demopage/
- 백본 참고: https://github.com/OpenBMB/MiniCPM
- 고처리량 서빙 엔진: https://github.com/a710128/nanovllm-voxcpm

## 저장소 페이지에서 보존한 빠른 시작 정보

저장소에 제시된 설치 명령:

```bash
pip install voxcpm
```

페이지에 적힌 요구 사항:

- Python >= 3.10, < 3.13
- PyTorch >= 2.5.0
- CUDA >= 12.0

저장소가 보여주는 기본 사용 패턴:

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

또한 저장소는 Voice Design, 음성 클로닝, 배치 생성, `python app.py --port 8808` 기반 로컬 웹 데모 실행 예시도 함께 제시합니다.

## 저장소의 버전 비교 표에서 보존한 핵심 포인트

저장소는 세 버전을 비교합니다.

- VoxCPM2, 최신 버전으로 표시
- VoxCPM1.5, 안정 버전으로 표시
- VoxCPM-0.5B, 레거시로 표시

표에는 예를 들어 다음과 같은 주장들이 포함됩니다.

- VoxCPM2는 2B 백본을 사용
- VoxCPM2는 48kHz 오디오 출력 지원
- VoxCPM2는 30개 언어 지원
- VoxCPM2는 Voice Design과 제어형 음성 클로닝 추가
- VoxCPM2는 약 8GB VRAM 사용
- RTX 4090에서 약 0.30 RTF, Nano-VLLM 사용 시 약 0.13 RTF

## 저장소에서 보존한 아키텍처 메모

저장소는 VoxCPM2가 AudioVAE V2의 latent space 안에서 다음 네 단계 파이프라인으로 동작한다고 설명합니다.

- LocEnc
- TSLM
- RALM
- LocDiT

저장소 설명에 따르면 이 구성이 표현력 있는 합성과 48kHz 출력의 기반입니다.

## 보존 한계 메모

이 아카이브는 GitHub 공개 저장소 페이지에서 확인 가능한 개요와 README 수준 설명을 보존한 것입니다. 전체 저장소 코드, 모델 가중치, 문서 사이트 전체, 실행 검증 결과까지 포함한 보존은 아닙니다.
