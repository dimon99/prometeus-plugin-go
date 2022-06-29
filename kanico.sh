docker run \
    -v "$HOME"/$CODE_FOLDER_WITH_DOCKERFILE/:/workspace \
    -e GOOGLE_APPLICATION_CREDENTIALS=/workspace/mycode/creds.json \
    gcr.io/kaniko-project/executor:v1.6.0 \
    --dockerfile /workspace/Dockerfile \
    --destination "gcr.io/$PROJECT_ID/$IMAGE_NAME:$TAG" \
    --context dir:///workspace/
