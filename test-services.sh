#!/bin/bash

echo "Testing S3 service..."
curl -f http://localhost:5001/upload || echo "S3 service not responding"

echo "Testing SQS service..."
curl -f http://localhost:5002/send || echo "SQS service not responding"

echo "Send test message to SQS..."
curl -X POST -d "message=test-message" http://localhost:5002/send