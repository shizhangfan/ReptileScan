# ReptileScan

## Tech Stack

-   IOS
-   Mobile phone only
-   SwiftUI

## Features

1. Reptile Species Identification
2. Sighting Log
3. Field guide And Compare
4. Safety and Ethics(High Value For Reptiles)
5. Community and Varification

## MVP

1. Reptile Species Identification
2. Sighting log(Photo, Species, Timestamp, GPS, Notes), list + detail + map
3. Minimal field guide with 20-50 common species and a small lookalikes list
4. Safety flag for venomous species
5. Exports and iCloud backup(Basic)

## Use Hybrid Identification Strategy: Both online and offline model

1. Use third-party API or common model like GPT for recognization
2. Use an basic local-ML model when endpoint cannot access network

## Capture and Identification Pipeline

1. Smart Capture
    - Camera hints: on-screen framing guides, glare/blur detection, "get closer" prompts
    - Multi-shot burst: Take 3-5 framew and pick the sharpest automatically
2. Low-confidence fallback
    - Guided Checklist: a quick dichotomous key(region, pattern, head shape, pupil type)
    - "Ask for Help" flow: Draft a Shareable Card or Community Post with the photo and metadata.
3. Photo quality coach
    - Post-Scan Feedback: "Backlighting reduced contrast, Try Side lighting" with tiny tips

## Data Model Sketch

-   Species
    -   id, commmonName, scientficName, photos[Local/remote], traits[tags], venomous: Bool, status: enum, range:[geo], lookalikes[refs]
-   Sighting
    -   id, speciesRef, data, location(lat/long/accuracy), habitat[tag], notes, photoRefs, modelVersion, confidence
-   ModelPack
    -   id, region, version, size, installedAt, availableUpdate
-   UserSettings
    -   mode(field/keeper), geoPrivacyLevel, analyticsOptln, units, notifications
-   HusbandryRecord(Keeper mode)
    -   id, animalRef, date, type(feed/shed/weight/env), value, notes

## UX flow highlights

-   Home/Scan tab
    -   Big scan button; last ID shown; “Import from Photos” secondary button.
-   Confirm ID screen
    -   Top-3, key differences, “Confirm” → Sighting saved; “Unsure” → guided checklist.
-   Log tab
    -   List with thumbnails, search/filter; Detail shows map and notes; “Edit” to update species if corrected.
-   Guide tab
    -   Search species; “Compare” action; lookalikes grouped; offline indicator.
-   Settings
    -   Mode toggle, data/privacy, model packs, export/backup, About
