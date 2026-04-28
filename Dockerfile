# Menggunakan base image Python resmi yang ringan
FROM python:3.9-slim

# Menetapkan direktori kerja di dalam container
WORKDIR /app

# Menyalin file requirements terlebih dahulu untuk memanfaatkan cache layer Docker
COPY requirements.txt .

# Menginstal dependensi yang diperlukan
RUN pip install --no-cache-dir -r requirements.txt

# Menyalin seluruh kode sumber aplikasi ke dalam direktori kerja
COPY . .

# Menentukan user non-root untuk keamanan (Opsional tapi sangat disarankan)
RUN useradd -m myuser
USER myuser

# Menentukan port yang akan digunakan oleh aplikasi
EXPOSE 8080

# Perintah untuk menjalankan aplikasi saat container dimulai
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "service:app"]
