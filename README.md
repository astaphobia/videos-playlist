# videos-playlist (vplay)

flutter project with 
 * `firebase_auth` authentication and also include `google_sign` for google OAuth.
 * `redux` for state management for easy implementation and also `flutter_redux` to.
 * `Stack` wrapper for fullpage loader from scratch
 * `dio` as Api connection like `axios` or `node-fetch` in node
 * `angle_validate` validation
 # Project Pattern
 ```
 lib
└── src
    ├── components        ➡️ StatelessWidget wrapper
    ├── pages             ➡️ pages | containers that wrapped by StoreConnector
    ├── res               ➡️ static values
    │   └── values
    ├── store 
    │   ├── actions       ➡️ include classes reactive state triggered
    │   ├── middlewares   ➡️ include voids that can call or inject into store as middleware list
    │   ├── models        ➡️ include classes model all is immutable, only can mutate by reducers
    │   └── reducers      ➡️ include reducers for mutate state
    └── utils             ➡️ helpers class 
    main.dart             ➡️ main class wrapped by StoreProvider
test                     ➡️ includes test classes
```
    
 # How To Run
 `flutter run`
 
 ### OnProgress
