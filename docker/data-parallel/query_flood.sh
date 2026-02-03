echo "Starting heavy flood of 100 unique requests..."

for i in {1..500}; do
   curl -s -o /dev/null http://localhost/v1/chat/completions \
     -H "Content-Type: application/json" \
     -d "{
       \"model\": \"meta-llama/Llama-3.1-8B-Instruct\", 
       \"messages\": [{\"role\": \"user\", \"content\": \"Write a very long, complex sentence about the number $i and how it relates to the history of cloud computing.\"}], 
       \"max_tokens\": 1000
     }" &
done

echo "All 100 heavy requests fired. Waiting..."
wait
echo "Done."
