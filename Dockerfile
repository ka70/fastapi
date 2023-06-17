# 公式のイメージ ちなみに80がEXPOSEされている
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# python周りの設定
# pycを生成しない、および 標準出力と標準エラー出力がすぐに出力されるようにする
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PATH="/home/appuser/.local/bin:${PATH}"

# 日本語化周りの設定
RUN apt-get update && apt-get install -y locales && locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8 TZ=Asia/Tokyo

# お好みで
# RUN apt-get install -y vim less procps libssl-dev curl

# 専用のユーザーを作成してbashに変更する
RUN useradd --create-home appuser && chsh -s /bin/bash appuser
USER appuser
WORKDIR /home/appuser

# パッケージをインストール
COPY ./requirements.txt .
RUN pip install --upgrade pip setuptools \
    && pip install --no-cache-dir -r ./requirements.txt

# アプリケーションのソース
COPY ./app/ ./

