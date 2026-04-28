# Gunakan image dasar Python
FROM python:3.9-slim

# Atur direktori kerja
WORKDIR /app

# Salin file requirement dan install dependensi
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Salin seluruh isi proyek ke dalam kontainer
COPY . .

# Ekspos port yang digunakan aplikasi
EXPOSE 8080

# Jalankan aplikasi menggunakan Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "service:app"]
