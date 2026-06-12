# Figure Notes

## figure-01-hero.jpeg
- 원본 URL: https://discuss.pytorch.kr/uploads/default/original/3X/3/c/3c35da0679956e2fc0d640ea199f5027f499d317.jpeg
- 설명: 검은 배경과 파란 번개 그래픽 위에 `SUPERTONE`, `SUPERTONIC 3`, `Lightning-Fast, On-Device TTS`, `Now speaks in 31 languages`가 표시된 홍보용 히어로 이미지다.
- 보이는 주장: simple tags로 감정 표현, fewer reading errors 68%, programming languages 8+, on-device CPU-only, no GPU.
- 데이터성: 낮음에서 중간. 브랜드/요약형 이미지이며 68% 같은 수치가 있으나 비교 조건은 이미지 안에서 충분히 설명되지 않는다.
- 기사와의 관계: Supertonic 3의 핵심 포지셔닝인 빠른 온디바이스 다국어 TTS를 시각적으로 요약한다.

## figure-02-wer-cer-comparison.png
- 원본 URL: https://discuss.pytorch.kr/uploads/default/original/3X/6/2/625953a3ed38f1147df9f6bfbf43dfaeb3420234.png
- 설명: `Supertonic 3 in the Model Range`라는 제목의 언어별 WER/CER 비교 차트다. 보라색은 VoxCPM2, 파란색은 Supertonic 3이며 하단 축은 오류율 수치, 낮을수록 좋다.
- 비교 대상: Arabic, Czech, Dutch, English, Finnish, French, German, Greek, Hindi, Indonesian, Italian, Japanese, Korean, Polish, Portuguese, Romanian, Russian, Spanish, Turkish, Ukrainian, Vietnamese 등 다국어 항목에서 VoxCPM2와 Supertonic 3를 비교한다.
- 핵심 메시지: Supertonic 3가 훨씬 작은 모델임에도 일부 언어에서는 VoxCPM2와 유사하거나 더 낮은 오류 범위를 보인다는 주장을 뒷받침한다.
- 데이터성: 높음. 언어별 수치 차트를 포함하지만, 독립 재현 자료는 별도 확인이 필요하다.

## figure-03-parameter-comparison.png
- 원본 URL: https://discuss.pytorch.kr/uploads/default/original/3X/4/7/47fccd25166b6ea81d7a3d6e7d07ac94f165239e.png
- 설명: `Model Size Comparison` 차트다. VoxCPM2 2B, Qwen3-TTS 1.7B, OmniVoice 800M, SonaSpeech2 700M, Supertonic 3 99M, Supertonic 2 66M을 비교한다.
- 핵심 메시지: Supertonic 3는 99M 파라미터로, 0.7B-2B급 경쟁 모델보다 훨씬 작아 온디바이스 배포에 유리하다는 주장이다.
- 데이터성: 높음. 모델 파라미터 규모 비교 자료다.

## figure-04-cpu-runtime-memory.png
- 원본 URL: https://discuss.pytorch.kr/uploads/default/original/3X/c/0/c084d04b3e4b1d468369d8f9933764a17ee7d4d9.png
- 설명: `CPU vs GPU Runtime Footprint` 차트다. 위쪽은 latency로 mean real-time factor를 로그 스케일로 비교하고, 아래쪽은 peak memory를 GiB 단위로 비교한다.
- 보이는 비교: Supertonic 3 CPU는 latency RTF 0.172, memory 2.0 GiB로 표시된다. Supertonic 2 CPU는 RTF 0.119, memory 1.57 GiB다. OmniVoice, VoxCPM2, Qwen3-TTS 등의 A100 GPU/CPU baseline과 함께 배치되어 있다.
- 핵심 메시지: Supertonic 3가 CPU-only 실행에서도 실시간보다 빠른 합성 속도를 내고, GPU baseline보다 낮은 메모리 풋프린트를 보일 수 있다는 주장이다.
- 데이터성: 높음. 단, 테스트 하드웨어와 설정에 따라 달라지므로 목표 환경에서 재현 필요하다.
