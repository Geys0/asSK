# asSK - Flutter + .NET + SQL + Docker Project

## Project Overview
A modern application built with Flutter frontend, .NET backend, SQL database, and Docker containerization.

## Tech Stack
- **Frontend**: Flutter with BLoC pattern
- **Backend**: .NET Core Web API
- **Database**: SQL Server
- **Containerization**: Docker
- **State Management**: BLoC (Business Logic Component)
- **Architecture**: MVP (Model-View-Presenter)

## Project Structure
```
asSK/
├── frontend/                 # Flutter application
│   ├── lib/
│   │   ├── blocs/           # BLoC state management
│   │   ├── models/          # Data models
│   │   ├── views/           # UI screens
│   │   ├── repositories/    # Data repositories
│   │   └── services/        # API services
│   └── pubspec.yaml
├── backend/                  # .NET Core Web API
│   ├── Controllers/         # API controllers
│   ├── Models/              # Data models
│   ├── Services/            # Business logic
│   ├── Data/                # Database context
│   └── asSK.API.csproj
├── database/                 # SQL scripts and migrations
├── docker/                   # Docker configuration
└── docs/                     # Documentation
```

## Getting Started

### Prerequisites
- Flutter SDK
- .NET Core SDK
- Docker Desktop
- SQL Server

### Quick Start
1. Clone the repository
2. Run `docker-compose up` to start services
3. Start the backend: `cd backend && dotnet run`
4. Start the frontend: `cd frontend && flutter run`

## Development Status
🚧 **In Development** - Setting up project structure and background agents

## Background Agents
This project uses Cursor AI background agents for:
- Code review and suggestions
- Automated testing
- Performance optimization
- Security scanning
- Documentation updates

## Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License
MIT License
