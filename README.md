# MediQuoMobileTestApp

Application made on the rest api https://breakingbadapi.com/

- Architecture: 
   - Clean MVP-R+B: Architecture based on MVP but adding the clean architecture, builder and router layers.
 
- Project structure :

   - Data: Layer where everything related to data is stored.
        - DTO.
        - Network.
        - Realm.
        - Repositories
   - Domain: Layer where the data to be displayed by the application is managed.
        - Entities.
        - UseCases.
    - Common: Layer where resources that will help the application to work are managed.
        - Utils.
        - Extensions.
    - Presentation: Layer of components and scenes.
        - Components.
        - Scenes.
    - Resources: Application resources.
        - Mocks.
        - Assets.
        - Localizable.

   - Third party libraries: 
       -   Api requests: Alamofire.
       -   Load images: SDWebImage.
       -   Database: Realm
      
  - Special features:
       -   Locked to light mode.
