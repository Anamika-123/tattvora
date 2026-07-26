# Tattvora Architecture

> **Version:** MVP v1.0  
> **Status:** Draft  
> **Last Updated:** July 2026

---

# 1. Introduction

Tattvora is an AI-powered holistic wellness platform designed to make personalised wellness accessible through technology.

The platform combines yoga, meditation, nutrition, Ayurveda and artificial intelligence to help users build sustainable wellness habits based on their individual goals, lifestyle and health profile.

This document provides a high-level overview of the system architecture, core modules, technology stack and engineering principles that guide the development of the platform.

---

# 2. Vision

Our vision is to build a scalable wellness platform where technology enhances human coaching rather than replacing it.

Tattvora combines expert-led wellness programs with intelligent software to deliver personalised experiences while keeping certified yoga teachers at the centre of every user's wellness journey.

Artificial intelligence is introduced gradually to improve recommendations, automate repetitive tasks and provide continuous support, while wellness programs continue to be created and reviewed by qualified professionals.

---

# 3. System Overview

The platform is organised around a personalised wellness journey.

Users begin by creating an account and completing a wellness assessment. Based on their health profile, lifestyle, wellness goals and experience level, the platform recommends suitable wellness programs.

After subscribing to a program, users gain access to a personalised dashboard where they can attend live sessions, view recorded classes, track progress, monitor attendance and interact with AI-powered wellness features.

Teachers manage wellness programs, monitor student progress and receive AI-generated insights to provide better guidance.

The platform is designed to evolve incrementally, allowing new AI capabilities and wellness services to be introduced without significant architectural changes.

---

# 4. High-Level Architecture

Tattvora follows a **modular monolithic architecture** built with Ruby on Rails.

The Rails application serves as the central system responsible for user management, authentication, business logic, subscriptions, payments and communication between internal modules and external services.

The application integrates several supporting services, each with a dedicated responsibility:

- **PostgreSQL** stores all application data.
- **Redis** provides caching and supports background job processing.
- **Sidekiq** executes asynchronous tasks such as notifications, emails and scheduled jobs.
- **Active Storage** manages uploaded media and recorded session files.
- **OpenAI / Gemini** provide AI-powered recommendations and conversational capabilities.
- **FastAPI (Future)** will host dedicated AI services as machine learning capabilities expand.

This architecture keeps the MVP simple while providing a clear path towards future scalability and service-oriented expansion.

---

# 5. Core Modules

Tattvora is organised into independent business modules. Each module has a clearly defined responsibility while collaborating with other modules to provide a seamless wellness experience.

### User Management

Handles user registration, authentication, authorization and profile management for students, teachers and administrators.

### Wellness Assessment

Collects information about each user's health profile, lifestyle, wellness goals and experience level. This information forms the foundation for personalised recommendations and future AI-powered insights.

### Wellness Program Management

Allows teachers to create, manage and publish structured wellness programs that users can enrol in.

### Subscription & Payments

Manages subscription plans, payment processing and user enrolments into wellness programs.

### Student Dashboard

Provides users with a personalised workspace where they can access enrolled programs, upcoming sessions, recorded classes, attendance history and progress tracking.

### Teacher Dashboard

Enables teachers to manage students, review attendance, monitor progress and receive AI-generated insights to improve student engagement.

### Notification System

Delivers reminders, class schedules, payment confirmations and system notifications using asynchronous background processing.

### AI & Intelligence Services

Provides intelligent capabilities including personalised program recommendations, conversational assistance, wellness check-ins and future AI-powered coaching experiences.

---

# 6. Technology Stack

| Component | Technology |
|-----------|------------|
| Backend | Ruby on Rails |
| Database | PostgreSQL |
| Background Jobs | Sidekiq |
| Cache | Redis |
| Frontend | Hotwire, Tailwind CSS |
| Authentication | Devise |
| Authorization | Pundit |
| File Storage | Active Storage |
| AI Integration | OpenAI / Gemini |
| Future AI Services | Python (FastAPI) |
| Vector Database | pgvector |
| Payments | Razorpay |
| Testing | RSpec, FactoryBot, Capybara |
| Deployment | Render |
| CI/CD | GitHub Actions |

---

# 7. Engineering Principles

Tattvora follows a set of engineering principles to ensure the platform remains maintainable, secure and scalable.

- Build modular components with clear responsibilities.
- Keep business logic inside service objects.
- Keep controllers lightweight and focused.
- Follow RESTful conventions and Rails best practices.
- Design database schemas with scalability in mind.
- Use background jobs for asynchronous and long-running tasks.
- Write automated tests for critical business workflows.
- Prioritise security and user privacy.
- Treat AI as an enhancement to expert-led wellness rather than a replacement.
- Document architectural decisions alongside development.

---

# 8. Future Architecture

The MVP establishes a solid monolithic foundation using Ruby on Rails.

As the platform grows, additional services will be introduced incrementally while preserving the existing architecture.

### AI Platform

- AI-powered wellness coaching
- FastAPI AI services
- Retrieval-Augmented Generation (RAG)
- Vector search using pgvector

### Wellness Platform

- Nutrition planning
- Ayurveda consultations
- AI yoga instructor

### Platform Expansion

- Community platform
- Mobile applications
- Wearable device integrations