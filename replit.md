# Air Quality Predictor

## Overview
Air Quality Predictor is a full-stack machine learning application that predicts PM2.5 air quality levels based on date and time parameters. The application uses a Random Forest Regressor model trained on air quality data to make predictions.

**Tech Stack:**
- Frontend: React 18, TailwindCSS, Redux Toolkit, React Router
- Backend: FastAPI (Python)
- Machine Learning: scikit-learn (Random Forest Regressor)
- Development: Node.js 20, Python 3.11

## Current State
✅ Fully configured and running on Replit
- Frontend runs on port 5000 (React development server)
- Backend runs on port 8000 (FastAPI with Uvicorn)
- Both services start automatically via the configured workflow
- Frontend proxies API requests to backend
- Machine learning model is pre-trained and loaded from pickle files

## Recent Changes (2025-10-14)
- Initial Replit setup completed
- Installed Python 3.11 and Node.js 20
- Configured environment variables for frontend-backend communication
- Added PostCSS configuration for TailwindCSS v3 compatibility
- Created startup script (`start.sh`) to run both frontend and backend
- Configured workflow "Air Quality Predictor" to run the application
- Added comprehensive .gitignore for Python and Node.js
- Configured deployment settings for VM target
- Frontend configured to allow all hosts for Replit proxy

## Project Architecture

### Frontend (`/frontend`)
- **Framework**: React with Create React App
- **Routing**: React Router DOM
- **State Management**: Redux Toolkit
- **Styling**: TailwindCSS 3.3.3
- **UI Components**: 
  - Welcome page with typewriter effect
  - Air Quality Form for input
  - Result page displaying predictions
  - About page with project information
- **API Integration**: Axios for HTTP requests to backend

### Backend (`/backend`)
- **Framework**: FastAPI
- **Server**: Uvicorn (development) / Gunicorn (production)
- **ML Model**: Random Forest Regressor (pre-trained)
- **Data Processing**: pandas, numpy, scikit-learn
- **Endpoints**:
  - `GET /` - Health check
  - `POST /predict` - Air quality prediction

### Machine Learning Model
- **Algorithm**: Random Forest Regressor
- **Training Accuracy**: 98.76%
- **Testing Accuracy**: 91.67%
- **Features**: Year, Month, Day, Hour
- **Target**: PM2.5 concentration
- **Model Files**: 
  - `mymodel.pkl` - Trained model
  - `mystandardscaler.pkl` - Feature scaler

## User Preferences
- None specified yet

## How to Run

### Development
The application is configured to run automatically via the workflow:
1. Click "Run" or the workflow will start automatically
2. The backend starts on localhost:8000
3. The frontend starts on 0.0.0.0:5000
4. Access the application through the Replit preview

### Manual Startup
```bash
# Start both frontend and backend
bash start.sh
```

### Individual Services
```bash
# Backend only
cd backend
uvicorn app:app --host localhost --port 8000

# Frontend only
cd frontend
npm start
```

## Configuration Files

### Environment Variables (`frontend/.env`)
- `PORT=5000` - Frontend server port
- `HOST=0.0.0.0` - Frontend host (required for Replit)
- `REACT_APP_FASTAPI_BACKEND=/predict` - Backend API endpoint
- `WDS_SOCKET_PORT=0` - WebSocket configuration
- `DANGEROUSLY_DISABLE_HOST_CHECK=true` - Required for Replit proxy

### Proxy Configuration
- Frontend package.json includes proxy to `http://localhost:8000`
- This allows the frontend to make API calls to `/predict` which proxy to backend

## Deployment
- **Type**: VM deployment
- **Command**: `bash start.sh`
- **Requirements**: Both frontend and backend must run simultaneously
- The deployment is configured to use a VM to maintain state

## Known Issues & Warnings
- Minor ESLint warnings in Footer.jsx and ResultPage.jsx (non-critical)
- React 19 ref access deprecation warnings (cosmetic, will be addressed in future updates)

## Dependencies

### Python (Backend)
- fastapi
- pydantic
- uvicorn
- gunicorn
- scikit-learn==1.2.2
- numpy==1.24.4
- pandas
- cython==0.29.36

### Node.js (Frontend)
- react, react-dom (18.2.0)
- react-router-dom
- @reduxjs/toolkit
- axios
- tailwindcss (3.3.3)
- react-toastify
- react-simple-typewriter
- @tippyjs/react

## Data
- Training dataset: `air-quality-india.csv` (8,000 datapoints)
- Small dataset: `air-quality-india-small.csv`
- Jupyter notebook: `air_quality.ipynb` (model training code)

## Notes
- The model predicts PM2.5 concentration based on temporal features only
- Being trained on a limited dataset (8,000 samples), predictions may not always be accurate
- The application is designed for demonstration and educational purposes
