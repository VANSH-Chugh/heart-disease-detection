# 1. Choose a lightweight Python base image
FROM python:3.11-slim

# 2. Set a working directory
WORKDIR /app

# 3. Copy constraints/requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy your application code
COPY . .

# 5. Expose the port your Flask app runs on
EXPOSE 5000

# 6. Use Gunicorn for production‑grade serving
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]

