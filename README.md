# basic

## 项目架构

**核心技术栈**：

- **Isar 数据库**：高性能的本地数据库，用于存储应用数据。
- **Riverpod**：用于状态管理，提供灵活的依赖注入和状态监听。
- **OpenAPI**：通过自动生成的 API 客户端与后端服务交互。



## freezed

生成.freezed.dart和.g.dart文件，用于json序列化

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

## openapi

生成dart api文件
```shell
npx @openapitools/openapi-generator-cli generate -i openapi.yaml -g dart -o openapi
```
