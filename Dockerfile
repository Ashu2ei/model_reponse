# FROM python:latest
# ENV PYTHONUNBUFFERED 1
# WORKDIR /my_model
# COPY requirements.txt /my_model/
# RUN pip install --upgrade pip
# RUN pip install -r requirements.txt
# COPY . /my_model/
# #ARG MLRUN_PIP_VERSION=22.0.0
# ENV MLFLOW_TRACKING_URI="sqlite:///mlruns.db"
# ENV PORT 5000
# RUN python run.py
# #CMD my_model
# CMD mlflow models serve -m models:/SentimentAnalysis/latest -p 5000 --no-conda
#RUN ["mlflow models serve -m models:/SentimentAnalysis/latest -p 5000 --no-conda"]
#CMD ["mlflow" "models" "serve" "-m" "models:/SentimentAnalysis/latest" "-p" "5000" "--no-conda"]
#CMD ["python" , "run.py"]
#########################


FROM python:3
ENV MLFLOW_HOME /opt/mlflow
ENV MLFLOW_VERSION 1.24.0
# ENV HOST 0.0.0.0
ENV PORT 5050
RUN mkdir /mlmodel
WORKDIR /mlmodel
COPY requirements.txt /mlmodel
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /mlmodel
ENV MLFLOW_TRACKING_URI="sqlite:///mlruns.db"

EXPOSE 5050/tcp
#RUN export MLFLOW_TRACKING_URI=
#EXPOSE 5000
#CMD [ "python3", "run.py" ]
#CMD python3 run.py
#CMD ["mlflow models serve -m models:/SentimentAnalysis/latest -p 5000 --no-conda"]
CMD mlflow models serve -m models:/SentimentAnalysis/latest --host 0.0.0.0 --port ${PORT} --no-conda
#CMD mlflow models serve -m models:/Original-Model/latest --host 0.0.0.0 --port ${PORT}

############################

FROM python:3
ENV MLFLOW_HOME /opt/mlflow
ENV MLFLOW_VERSION 1.24.0
# ENV HOST 0.0.0.0
ENV PORT 5050
RUN mkdir /mlmodel
WORKDIR /mlmodel
COPY requirements.txt /mlmodel
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /mlmodel
ENV MLFLOW_TRACKING_URI="sqlite:///mlruns.db"

EXPOSE 5050/tcp
#RUN export MLFLOW_TRACKING_URI=
#EXPOSE 5000
RUN [ "python3", "run.py" ]
#CMD python3 run.py
#CMD ["mlflow models serve -m models:/SentimentAnalysis/latest -p 5000 --no-conda"]
CMD mlflow models serve -m models:/SentimentAnalysis/latest --host 0.0.0.0 --port ${PORT} --no-conda
#CMD mlflow models serve -m models:/Original-Model/latest --host 0.0.0.0 --port ${PORT}