# SIMPLIFIED BUSINESS PROCESS & MERMAID DIAGRAMS (HIGH-LEVEL BA)
**Project:** Nonstop Coding Platform (SWP391 Integrated Coding Education & Competitive Programming Platform)  
**Role:** Senior Business Analyst (BA)  
**Author / Student:** Duy Phuong (DE190416)  

---

## I. BA SPECIFICATION & ARCHITECTURAL RULES

In accordance with High-Level Business Process Modeling (BPMN / UML) guidelines, all Swimlane Diagrams in this document have been updated:
1. **Node Shape Standard:**
   - **Activity / Task Nodes:** Rendered as **Rounded Rectangles** using `node_id(Text)`.
   - **Start & End Nodes:** Rendered as **Square Boxes** `START[Start]` and `END[End]`.
   - **Gateways / Decision Nodes:** Rendered as **Diamonds** `CHOICE{Text}` and `MERGE_END{ }`.
2. **Lane Consolidation (2 Swimlanes):** 
   - **Lane 1 (`Actor`):** `👤 User / Student` (or `👨‍💻 Admin / Instructor`).
   - **Lane 2 (`System`):** `💻 System` (Consolidating Frontend UI, Backend API, and Database into a single system actor).
3. **Mermaid 3-Part Architecture (Draw.io Safe):**
   - **PART 1:** Subgraph definitions & local internal edges only (NO cross-lane arrows inside Part 1).
   - **PART 2:** Global control nodes (`START[Start]`, `END[End]`, `MERGE_END{ }`).
   - **PART 3:** Cross-lane connections at the end of the script.

---

## II. SIMPLIFIED SWIMLANE DIAGRAMS (ROUNDED RECTANGLE ACTIVITIES)

### 1. Swimlane Diagram: Browse & Search Problems

```mermaid
graph TB

    %% ==========================================================
    %% PART 1: SUBGRAPHS AND INTERNAL NODES (LOCAL DECLARATIONS)
    %% ==========================================================

    subgraph User["👤 User / Student"]
        U1(Access Practice Arena)
        U2(Enter search query or select filters)
        U3(View problem list & user statistics)
        CHOICE_ACTION{Choose Action}
        U4(Select a specific problem)

        %% Local User Lane Flows
        U3 --> CHOICE_ACTION
        CHOICE_ACTION -->|Search / Filter| U2
        CHOICE_ACTION -->|Select Problem| U4
    end

    subgraph System["💻 System"]
        S1(Load and aggregate problem list & user stats)
        S2(Filter and sort problem list)
        S3(Display problem detail page)

        %% Local System Lane Flows
    end

    %% ==========================================================
    %% PART 2: GLOBAL NODES (START, END, MERGE GATEWAYS)
    %% ==========================================================

    START[Start]
    END[End]
    MERGE_END{ }

    %% ==========================================================
    %% PART 3: CROSS-LANE CONNECTIONS (SYSTEM INTERACTIONS)
    %% ==========================================================

    %% Start to User Lane
    START --> U1

    %% User to System Interactions
    U1 --> S1
    U2 --> S2
    U4 --> S3

    %% System Responses to User
    S1 --> U3
    S2 --> U3

    %% Termination Merges to Single End Node
    CHOICE_ACTION -->|Finish / Exit| MERGE_END
    S3 --> MERGE_END
    MERGE_END --> END
```

---

### 2. Swimlane Diagram: Join Contest

```mermaid
graph TB

    %% ==========================================================
    %% PART 1: SUBGRAPHS AND INTERNAL NODES (LOCAL DECLARATIONS)
    %% ==========================================================

    subgraph User["👤 User / Student"]
        U1(Browse contest list)
        U2(Click 'Enter Arena' or 'Register')
        CHOICE_PRIVATE{Is Contest Private?}
        U3(Enter Contest Password)
        U5(View Confirmation Modal & Entry Pass)
        U6(Access Contest Arena)
        U7(View Error Notification)

        %% Local User Lane Flows
        U1 --> U2
        U2 --> CHOICE_PRIVATE
        CHOICE_PRIVATE -->|Yes| U3
        U5 --> U6
    end

    subgraph System["💻 System"]
        S1(Verify user login & contest status)
        S2{Validate Credentials & Registration}
        S3(Save contest registration record)
        S_ERR(Generate registration error notification)

        %% Local System Lane Flows
        S1 --> S2
        S2 -->|Valid Registration| S3
        S2 -->|Invalid / Password Error| S_ERR
    end

    %% ==========================================================
    %% PART 2: GLOBAL NODES (START, END, MERGE GATEWAYS)
    %% ==========================================================

    START[Start]
    END[End]
    MERGE_END{ }

    %% ==========================================================
    %% PART 3: CROSS-LANE CONNECTIONS (SYSTEM INTERACTIONS)
    %% ==========================================================

    %% Start & User to System Requests
    START --> U1
    
    CHOICE_PRIVATE -->|No| S1
    U3 --> S1

    %% System Responses to User
    S3 --> U5
    S_ERR --> U7

    %% Termination Merges to Single End Node
    U6 --> MERGE_END
    U7 --> MERGE_END
    MERGE_END --> END
```

---

### 3. Swimlane Diagram: Create Contests

```mermaid
graph TB

    %% ==========================================================
    %% PART 1: SUBGRAPHS AND INTERNAL NODES (LOCAL DECLARATIONS)
    %% ==========================================================

    subgraph Admin["👨‍💻 Admin / Instructor"]
        A1(Open Create Contest Form)
        A2(Input contest details & schedule)
        A3(Submit contest configuration)
        A4(Select & attach problems to contest)
        A5(Publish contest)

        %% Local Admin Lane Flows
        A1 --> A2
        A2 --> A3
    end

    subgraph System["💻 System"]
        S1(Validate input & create Draft Contest)
        S2(Link selected problems to contest)
        S3(Update status to Published & notify users)

        %% Local System Lane Flows
    end

    %% ==========================================================
    %% PART 2: GLOBAL NODES (START, END, MERGE GATEWAYS)
    %% ==========================================================

    START[Start]
    END[End]
    MERGE_END{ }

    %% ==========================================================
    %% PART 3: CROSS-LANE CONNECTIONS (SYSTEM INTERACTIONS)
    %% ==========================================================

    %% Start & Admin to System Interactions
    START --> A1
    A3 --> S1
    S1 --> A4
    A4 --> S2
    S2 --> A5
    A5 --> S3

    %% Termination Merges to Single End Node
    S3 --> MERGE_END
    MERGE_END --> END
```

---

## III. STATE DIAGRAM: CONTEST STATUS

```mermaid
stateDiagram-v2
    [*] --> DRAFT : Admin creates new Contest\n(POST /api/admin/contests)

    state DRAFT {
        [*] --> EditConfig : Configure details & problem set
    }

    DRAFT --> PUBLISHED : Admin clicks "Publish"\n(status = PUBLISHED)
    DRAFT --> DELETED : Admin clicks "Delete Contest"\n(status = DELETED)

    state PUBLISHED {
        [*] --> UPCOMING : [now < startTime]\nAllow participants to pre-register

        UPCOMING --> ONGOING : [now >= startTime]\nContest begins & problem access enabled
        ONGOING --> ENDED : [now > endTime]\nContest duration ends & submission locked
    }

    UPCOMING --> DELETED : Admin cancels contest before start\n(status = DELETED)

    DELETED --> DRAFT : Admin clicks "Restore Contest"\n(POST /api/admin/contests/{id}/restore)

    DELETED --> [*] : Admin performs Hard Delete\n(Only if no submissions exist)
```
