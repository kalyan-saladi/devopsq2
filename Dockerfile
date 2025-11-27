FROM python:3.9-slim
WORKDIR /app
COPY app.py /app/
RUN pip install flask
EXPOSE 12200
CMD ["python", "app.py"]
