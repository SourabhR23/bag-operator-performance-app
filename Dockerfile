# Use an official Python base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install required Python libraries
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the port Streamlit runs on (default is 8501)
EXPOSE 8501

# Health-check 
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
