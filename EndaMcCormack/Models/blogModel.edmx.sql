
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 12/04/2013 00:54:13
-- Generated from EDMX file: C:\Users\Enda\Google Drive\Personal\EndaMcCormack\EndaMcCormack\Models\blogModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [master];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__21B6055D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__Appli__21B6055D];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__22AA2996]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__UserI__22AA2996];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__5AEE82B9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [FK__aspnet_Pa__Appli__5AEE82B9];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__628FA481]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] DROP CONSTRAINT [FK__aspnet_Pe__PathI__628FA481];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__68487DD7]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__PathI__68487DD7];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__693CA210]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__UserI__693CA210];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__38996AB5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Profile] DROP CONSTRAINT [FK__aspnet_Pr__UserI__38996AB5];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__440B1D61]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__0DAF0CB0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [FK__aspnet_Us__Appli__0DAF0CB0];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__4AB81AF0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__RoleI__4AB81AF0];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__49C3F6B7]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__UserI__49C3F6B7];
GO
IF OBJECT_ID(N'[dbo].[FK_Comments_Posts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Posts];
GO
IF OBJECT_ID(N'[CoderDojo].[FK_Contents_Headers]', 'F') IS NOT NULL
    ALTER TABLE [CoderDojo].[Contents] DROP CONSTRAINT [FK_Contents_Headers];
GO
IF OBJECT_ID(N'[CoderDojo].[FK_Headers_Subjects]', 'F') IS NOT NULL
    ALTER TABLE [CoderDojo].[Headers] DROP CONSTRAINT [FK_Headers_Subjects];
GO
IF OBJECT_ID(N'[dbo].[FK_PortfolioPostsFiles_PortfolioFiles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PortfolioPostsFiles] DROP CONSTRAINT [FK_PortfolioPostsFiles_PortfolioFiles];
GO
IF OBJECT_ID(N'[dbo].[FK_PortfolioPostsFiles_PortfolioPosts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PortfolioPostsFiles] DROP CONSTRAINT [FK_PortfolioPostsFiles_PortfolioPosts];
GO
IF OBJECT_ID(N'[dbo].[FK_PortfolioPostsLinks_PortfolioPostsLinks]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PortfolioPostsLinks] DROP CONSTRAINT [FK_PortfolioPostsLinks_PortfolioPostsLinks];
GO
IF OBJECT_ID(N'[dbo].[FK_PortfolioPostsLinks_PortfolioPostsLinks1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PortfolioPostsLinks] DROP CONSTRAINT [FK_PortfolioPostsLinks_PortfolioPostsLinks1];
GO
IF OBJECT_ID(N'[dbo].[FK_PortfolioPostsTags_Posts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PortfolioPostsTags] DROP CONSTRAINT [FK_PortfolioPostsTags_Posts];
GO
IF OBJECT_ID(N'[dbo].[FK_PortfolioPostsTags_Tags]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PortfolioPostsTags] DROP CONSTRAINT [FK_PortfolioPostsTags_Tags];
GO
IF OBJECT_ID(N'[dbo].[FK_PostsTags_Posts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostsTags] DROP CONSTRAINT [FK_PostsTags_Posts];
GO
IF OBJECT_ID(N'[dbo].[FK_PostsTags_Tags]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostsTags] DROP CONSTRAINT [FK_PostsTags_Tags];
GO
IF OBJECT_ID(N'[dbo].[FK_TutorialComments_Posts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TutorialComments] DROP CONSTRAINT [FK_TutorialComments_Posts];
GO
IF OBJECT_ID(N'[dbo].[FK_TutorialPostsTags_Posts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TutorialPostsTags] DROP CONSTRAINT [FK_TutorialPostsTags_Posts];
GO
IF OBJECT_ID(N'[dbo].[FK_TutorialPostsTags_Tags]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TutorialPostsTags] DROP CONSTRAINT [FK_TutorialPostsTags_Tags];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[CoderDojo].[Contents]', 'U') IS NOT NULL
    DROP TABLE [CoderDojo].[Contents];
GO
IF OBJECT_ID(N'[CoderDojo].[Headers]', 'U') IS NOT NULL
    DROP TABLE [CoderDojo].[Headers];
GO
IF OBJECT_ID(N'[CoderDojo].[Subjects]', 'U') IS NOT NULL
    DROP TABLE [CoderDojo].[Subjects];
GO
IF OBJECT_ID(N'[dbo].[Administrators]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Administrators];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Applications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Applications];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Membership]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Membership];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Paths]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Paths];
GO
IF OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_PersonalizationAllUsers];
GO
IF OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_PersonalizationPerUser];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Profile]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Profile];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Roles];
GO
IF OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_SchemaVersions];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Users];
GO
IF OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_UsersInRoles];
GO
IF OBJECT_ID(N'[dbo].[aspnet_WebEvent_Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_WebEvent_Events];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[PortfolioFiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PortfolioFiles];
GO
IF OBJECT_ID(N'[dbo].[PortfolioLinks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PortfolioLinks];
GO
IF OBJECT_ID(N'[dbo].[PortfolioPosts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PortfolioPosts];
GO
IF OBJECT_ID(N'[dbo].[PortfolioPostsFiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PortfolioPostsFiles];
GO
IF OBJECT_ID(N'[dbo].[PortfolioPostsLinks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PortfolioPostsLinks];
GO
IF OBJECT_ID(N'[dbo].[PortfolioPostsTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PortfolioPostsTags];
GO
IF OBJECT_ID(N'[dbo].[PortfolioProjectType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PortfolioProjectType];
GO
IF OBJECT_ID(N'[dbo].[PortfolioTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PortfolioTags];
GO
IF OBJECT_ID(N'[dbo].[Posts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Posts];
GO
IF OBJECT_ID(N'[dbo].[PostsTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostsTags];
GO
IF OBJECT_ID(N'[dbo].[Skills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Skills];
GO
IF OBJECT_ID(N'[dbo].[Tags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tags];
GO
IF OBJECT_ID(N'[dbo].[TutorialComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TutorialComments];
GO
IF OBJECT_ID(N'[dbo].[TutorialPosts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TutorialPosts];
GO
IF OBJECT_ID(N'[dbo].[TutorialPostsTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TutorialPostsTags];
GO
IF OBJECT_ID(N'[dbo].[TutorialTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TutorialTags];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Administrators'
CREATE TABLE [dbo].[Administrators] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [Password] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'aspnet_Applications'
CREATE TABLE [dbo].[aspnet_Applications] (
    [ApplicationName] nvarchar(256)  NOT NULL,
    [LoweredApplicationName] nvarchar(256)  NOT NULL,
    [ApplicationId] uniqueidentifier  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'aspnet_Membership'
CREATE TABLE [dbo].[aspnet_Membership] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [Password] nvarchar(128)  NOT NULL,
    [PasswordFormat] int  NOT NULL,
    [PasswordSalt] nvarchar(128)  NOT NULL,
    [MobilePIN] nvarchar(16)  NULL,
    [Email] nvarchar(256)  NULL,
    [LoweredEmail] nvarchar(256)  NULL,
    [PasswordQuestion] nvarchar(256)  NULL,
    [PasswordAnswer] nvarchar(128)  NULL,
    [IsApproved] bit  NOT NULL,
    [IsLockedOut] bit  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastLoginDate] datetime  NOT NULL,
    [LastPasswordChangedDate] datetime  NOT NULL,
    [LastLockoutDate] datetime  NOT NULL,
    [FailedPasswordAttemptCount] int  NOT NULL,
    [FailedPasswordAttemptWindowStart] datetime  NOT NULL,
    [FailedPasswordAnswerAttemptCount] int  NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] datetime  NOT NULL,
    [Comment] nvarchar(max)  NULL
);
GO

-- Creating table 'aspnet_Paths'
CREATE TABLE [dbo].[aspnet_Paths] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NOT NULL,
    [Path] nvarchar(256)  NOT NULL,
    [LoweredPath] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'aspnet_PersonalizationAllUsers'
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers] (
    [PathId] uniqueidentifier  NOT NULL,
    [PageSettings] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_PersonalizationPerUser'
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser] (
    [Id] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NULL,
    [UserId] uniqueidentifier  NULL,
    [PageSettings] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_Profile'
CREATE TABLE [dbo].[aspnet_Profile] (
    [UserId] uniqueidentifier  NOT NULL,
    [PropertyNames] nvarchar(max)  NOT NULL,
    [PropertyValuesString] nvarchar(max)  NOT NULL,
    [PropertyValuesBinary] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_Roles'
CREATE TABLE [dbo].[aspnet_Roles] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL,
    [RoleName] nvarchar(256)  NOT NULL,
    [LoweredRoleName] nvarchar(256)  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'aspnet_SchemaVersions'
CREATE TABLE [dbo].[aspnet_SchemaVersions] (
    [Feature] nvarchar(128)  NOT NULL,
    [CompatibleSchemaVersion] nvarchar(128)  NOT NULL,
    [IsCurrentVersion] bit  NOT NULL
);
GO

-- Creating table 'aspnet_Users'
CREATE TABLE [dbo].[aspnet_Users] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [LoweredUserName] nvarchar(256)  NOT NULL,
    [MobileAlias] nvarchar(16)  NULL,
    [IsAnonymous] bit  NOT NULL,
    [LastActivityDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_WebEvent_Events'
CREATE TABLE [dbo].[aspnet_WebEvent_Events] (
    [EventId] char(32)  NOT NULL,
    [EventTimeUtc] datetime  NOT NULL,
    [EventTime] datetime  NOT NULL,
    [EventType] nvarchar(256)  NOT NULL,
    [EventSequence] decimal(19,0)  NOT NULL,
    [EventOccurrence] decimal(19,0)  NOT NULL,
    [EventCode] int  NOT NULL,
    [EventDetailCode] int  NOT NULL,
    [Message] nvarchar(1024)  NULL,
    [ApplicationPath] nvarchar(256)  NULL,
    [ApplicationVirtualPath] nvarchar(256)  NULL,
    [MachineName] nvarchar(256)  NOT NULL,
    [RequestUrl] nvarchar(1024)  NULL,
    [ExceptionType] nvarchar(256)  NULL,
    [Details] nvarchar(max)  NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [PostID] int  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [Email] nvarchar(128)  NOT NULL,
    [Body] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PortfolioFiles'
CREATE TABLE [dbo].[PortfolioFiles] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Link] nvarchar(255)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'PortfolioLinks'
CREATE TABLE [dbo].[PortfolioLinks] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Link] nvarchar(255)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'PortfolioPosts'
CREATE TABLE [dbo].[PortfolioPosts] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(128)  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Body] nvarchar(max)  NOT NULL,
    [ProjTypeID] int  NOT NULL
);
GO

-- Creating table 'PortfolioProjectTypes'
CREATE TABLE [dbo].[PortfolioProjectTypes] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [description] nvarchar(max)  NULL
);
GO

-- Creating table 'PortfolioTags'
CREATE TABLE [dbo].[PortfolioTags] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NULL
);
GO

-- Creating table 'Posts'
CREATE TABLE [dbo].[Posts] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(128)  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Body] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NULL
);
GO

-- Creating table 'TutorialComments'
CREATE TABLE [dbo].[TutorialComments] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [PostID] int  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [Email] nvarchar(128)  NOT NULL,
    [Body] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TutorialPosts'
CREATE TABLE [dbo].[TutorialPosts] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(128)  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Body] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TutorialTags'
CREATE TABLE [dbo].[TutorialTags] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NULL
);
GO

-- Creating table 'Skills'
CREATE TABLE [dbo].[Skills] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Body] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Contents'
CREATE TABLE [dbo].[Contents] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NULL,
    [Description] nvarchar(150)  NULL,
    [Code] nvarchar(max)  NULL,
    [MoreInfo] nvarchar(150)  NULL,
    [hasCode] bit  NOT NULL,
    [hasLooksLike] bit  NOT NULL,
    [hasMoreInfo] bit  NOT NULL,
    [headerId] int  NULL
);
GO

-- Creating table 'Headers'
CREATE TABLE [dbo].[Headers] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Header1] nvarchar(50)  NULL,
    [subjectID] int  NULL
);
GO

-- Creating table 'Subjects'
CREATE TABLE [dbo].[Subjects] (
    [id] int IDENTITY(1,1) NOT NULL,
    [subject1] nvarchar(50)  NULL
);
GO

-- Creating table 'aspnet_UsersInRoles'
CREATE TABLE [dbo].[aspnet_UsersInRoles] (
    [aspnet_Roles_RoleId] uniqueidentifier  NOT NULL,
    [aspnet_Users_UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'PortfolioPostsFiles'
CREATE TABLE [dbo].[PortfolioPostsFiles] (
    [PortfolioFiles_ID] int  NOT NULL,
    [PortfolioPosts_ID] int  NOT NULL
);
GO

-- Creating table 'PortfolioPostsLinks'
CREATE TABLE [dbo].[PortfolioPostsLinks] (
    [PortfolioPosts_ID] int  NOT NULL,
    [PortfolioLinks_ID] int  NOT NULL
);
GO

-- Creating table 'PortfolioPostsTags'
CREATE TABLE [dbo].[PortfolioPostsTags] (
    [PortfolioPosts_ID] int  NOT NULL,
    [PortfolioTags_ID] int  NOT NULL
);
GO

-- Creating table 'PostsTags'
CREATE TABLE [dbo].[PostsTags] (
    [Posts_ID] int  NOT NULL,
    [Tags_ID] int  NOT NULL
);
GO

-- Creating table 'TutorialPostsTags'
CREATE TABLE [dbo].[TutorialPostsTags] (
    [TutorialPosts_ID] int  NOT NULL,
    [TutorialTags_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Administrators'
ALTER TABLE [dbo].[Administrators]
ADD CONSTRAINT [PK_Administrators]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ApplicationId] in table 'aspnet_Applications'
ALTER TABLE [dbo].[aspnet_Applications]
ADD CONSTRAINT [PK_aspnet_Applications]
    PRIMARY KEY CLUSTERED ([ApplicationId] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [PK_aspnet_Membership]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [PathId] in table 'aspnet_Paths'
ALTER TABLE [dbo].[aspnet_Paths]
ADD CONSTRAINT [PK_aspnet_Paths]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- Creating primary key on [PathId] in table 'aspnet_PersonalizationAllUsers'
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
ADD CONSTRAINT [PK_aspnet_PersonalizationAllUsers]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- Creating primary key on [Id] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [PK_aspnet_PersonalizationPerUser]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Profile'
ALTER TABLE [dbo].[aspnet_Profile]
ADD CONSTRAINT [PK_aspnet_Profile]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [RoleId] in table 'aspnet_Roles'
ALTER TABLE [dbo].[aspnet_Roles]
ADD CONSTRAINT [PK_aspnet_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [Feature], [CompatibleSchemaVersion] in table 'aspnet_SchemaVersions'
ALTER TABLE [dbo].[aspnet_SchemaVersions]
ADD CONSTRAINT [PK_aspnet_SchemaVersions]
    PRIMARY KEY CLUSTERED ([Feature], [CompatibleSchemaVersion] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Users'
ALTER TABLE [dbo].[aspnet_Users]
ADD CONSTRAINT [PK_aspnet_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [EventId] in table 'aspnet_WebEvent_Events'
ALTER TABLE [dbo].[aspnet_WebEvent_Events]
ADD CONSTRAINT [PK_aspnet_WebEvent_Events]
    PRIMARY KEY CLUSTERED ([EventId] ASC);
GO

-- Creating primary key on [ID] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PortfolioFiles'
ALTER TABLE [dbo].[PortfolioFiles]
ADD CONSTRAINT [PK_PortfolioFiles]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PortfolioLinks'
ALTER TABLE [dbo].[PortfolioLinks]
ADD CONSTRAINT [PK_PortfolioLinks]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PortfolioPosts'
ALTER TABLE [dbo].[PortfolioPosts]
ADD CONSTRAINT [PK_PortfolioPosts]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PortfolioProjectTypes'
ALTER TABLE [dbo].[PortfolioProjectTypes]
ADD CONSTRAINT [PK_PortfolioProjectTypes]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PortfolioTags'
ALTER TABLE [dbo].[PortfolioTags]
ADD CONSTRAINT [PK_PortfolioTags]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Posts'
ALTER TABLE [dbo].[Posts]
ADD CONSTRAINT [PK_Posts]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [PK_Tags]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'TutorialComments'
ALTER TABLE [dbo].[TutorialComments]
ADD CONSTRAINT [PK_TutorialComments]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'TutorialPosts'
ALTER TABLE [dbo].[TutorialPosts]
ADD CONSTRAINT [PK_TutorialPosts]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'TutorialTags'
ALTER TABLE [dbo].[TutorialTags]
ADD CONSTRAINT [PK_TutorialTags]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Skills'
ALTER TABLE [dbo].[Skills]
ADD CONSTRAINT [PK_Skills]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [id] in table 'Contents'
ALTER TABLE [dbo].[Contents]
ADD CONSTRAINT [PK_Contents]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Headers'
ALTER TABLE [dbo].[Headers]
ADD CONSTRAINT [PK_Headers]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [PK_Subjects]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [aspnet_Roles_RoleId], [aspnet_Users_UserId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [PK_aspnet_UsersInRoles]
    PRIMARY KEY NONCLUSTERED ([aspnet_Roles_RoleId], [aspnet_Users_UserId] ASC);
GO

-- Creating primary key on [PortfolioFiles_ID], [PortfolioPosts_ID] in table 'PortfolioPostsFiles'
ALTER TABLE [dbo].[PortfolioPostsFiles]
ADD CONSTRAINT [PK_PortfolioPostsFiles]
    PRIMARY KEY NONCLUSTERED ([PortfolioFiles_ID], [PortfolioPosts_ID] ASC);
GO

-- Creating primary key on [PortfolioPosts_ID], [PortfolioLinks_ID] in table 'PortfolioPostsLinks'
ALTER TABLE [dbo].[PortfolioPostsLinks]
ADD CONSTRAINT [PK_PortfolioPostsLinks]
    PRIMARY KEY NONCLUSTERED ([PortfolioPosts_ID], [PortfolioLinks_ID] ASC);
GO

-- Creating primary key on [PortfolioPosts_ID], [PortfolioTags_ID] in table 'PortfolioPostsTags'
ALTER TABLE [dbo].[PortfolioPostsTags]
ADD CONSTRAINT [PK_PortfolioPostsTags]
    PRIMARY KEY NONCLUSTERED ([PortfolioPosts_ID], [PortfolioTags_ID] ASC);
GO

-- Creating primary key on [Posts_ID], [Tags_ID] in table 'PostsTags'
ALTER TABLE [dbo].[PostsTags]
ADD CONSTRAINT [PK_PostsTags]
    PRIMARY KEY NONCLUSTERED ([Posts_ID], [Tags_ID] ASC);
GO

-- Creating primary key on [TutorialPosts_ID], [TutorialTags_ID] in table 'TutorialPostsTags'
ALTER TABLE [dbo].[TutorialPostsTags]
ADD CONSTRAINT [PK_TutorialPostsTags]
    PRIMARY KEY NONCLUSTERED ([TutorialPosts_ID], [TutorialTags_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ApplicationId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [FK__aspnet_Me__Appli__21B6055D]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Me__Appli__21B6055D'
CREATE INDEX [IX_FK__aspnet_Me__Appli__21B6055D]
ON [dbo].[aspnet_Membership]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Paths'
ALTER TABLE [dbo].[aspnet_Paths]
ADD CONSTRAINT [FK__aspnet_Pa__Appli__5AEE82B9]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pa__Appli__5AEE82B9'
CREATE INDEX [IX_FK__aspnet_Pa__Appli__5AEE82B9]
ON [dbo].[aspnet_Paths]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Roles'
ALTER TABLE [dbo].[aspnet_Roles]
ADD CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Ro__Appli__440B1D61'
CREATE INDEX [IX_FK__aspnet_Ro__Appli__440B1D61]
ON [dbo].[aspnet_Roles]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Users'
ALTER TABLE [dbo].[aspnet_Users]
ADD CONSTRAINT [FK__aspnet_Us__Appli__0DAF0CB0]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Us__Appli__0DAF0CB0'
CREATE INDEX [IX_FK__aspnet_Us__Appli__0DAF0CB0]
ON [dbo].[aspnet_Users]
    ([ApplicationId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [FK__aspnet_Me__UserI__22AA2996]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PathId] in table 'aspnet_PersonalizationAllUsers'
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
ADD CONSTRAINT [FK__aspnet_Pe__PathI__628FA481]
    FOREIGN KEY ([PathId])
    REFERENCES [dbo].[aspnet_Paths]
        ([PathId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PathId] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [FK__aspnet_Pe__PathI__68487DD7]
    FOREIGN KEY ([PathId])
    REFERENCES [dbo].[aspnet_Paths]
        ([PathId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pe__PathI__68487DD7'
CREATE INDEX [IX_FK__aspnet_Pe__PathI__68487DD7]
ON [dbo].[aspnet_PersonalizationPerUser]
    ([PathId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [FK__aspnet_Pe__UserI__693CA210]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pe__UserI__693CA210'
CREATE INDEX [IX_FK__aspnet_Pe__UserI__693CA210]
ON [dbo].[aspnet_PersonalizationPerUser]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_Profile'
ALTER TABLE [dbo].[aspnet_Profile]
ADD CONSTRAINT [FK__aspnet_Pr__UserI__38996AB5]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PostID] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_Comments_Posts]
    FOREIGN KEY ([PostID])
    REFERENCES [dbo].[Posts]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Comments_Posts'
CREATE INDEX [IX_FK_Comments_Posts]
ON [dbo].[Comments]
    ([PostID]);
GO

-- Creating foreign key on [PostID] in table 'TutorialComments'
ALTER TABLE [dbo].[TutorialComments]
ADD CONSTRAINT [FK_TutorialComments_Posts]
    FOREIGN KEY ([PostID])
    REFERENCES [dbo].[TutorialPosts]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorialComments_Posts'
CREATE INDEX [IX_FK_TutorialComments_Posts]
ON [dbo].[TutorialComments]
    ([PostID]);
GO

-- Creating foreign key on [aspnet_Roles_RoleId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
    FOREIGN KEY ([aspnet_Roles_RoleId])
    REFERENCES [dbo].[aspnet_Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [aspnet_Users_UserId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Users]
    FOREIGN KEY ([aspnet_Users_UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_aspnet_UsersInRoles_aspnet_Users'
CREATE INDEX [IX_FK_aspnet_UsersInRoles_aspnet_Users]
ON [dbo].[aspnet_UsersInRoles]
    ([aspnet_Users_UserId]);
GO

-- Creating foreign key on [PortfolioFiles_ID] in table 'PortfolioPostsFiles'
ALTER TABLE [dbo].[PortfolioPostsFiles]
ADD CONSTRAINT [FK_PortfolioPostsFiles_PortfolioFiles]
    FOREIGN KEY ([PortfolioFiles_ID])
    REFERENCES [dbo].[PortfolioFiles]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PortfolioPosts_ID] in table 'PortfolioPostsFiles'
ALTER TABLE [dbo].[PortfolioPostsFiles]
ADD CONSTRAINT [FK_PortfolioPostsFiles_PortfolioPosts]
    FOREIGN KEY ([PortfolioPosts_ID])
    REFERENCES [dbo].[PortfolioPosts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PortfolioPostsFiles_PortfolioPosts'
CREATE INDEX [IX_FK_PortfolioPostsFiles_PortfolioPosts]
ON [dbo].[PortfolioPostsFiles]
    ([PortfolioPosts_ID]);
GO

-- Creating foreign key on [PortfolioPosts_ID] in table 'PortfolioPostsLinks'
ALTER TABLE [dbo].[PortfolioPostsLinks]
ADD CONSTRAINT [FK_PortfolioPostsLinks_PortfolioPosts]
    FOREIGN KEY ([PortfolioPosts_ID])
    REFERENCES [dbo].[PortfolioPosts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PortfolioLinks_ID] in table 'PortfolioPostsLinks'
ALTER TABLE [dbo].[PortfolioPostsLinks]
ADD CONSTRAINT [FK_PortfolioPostsLinks_PortfolioLinks]
    FOREIGN KEY ([PortfolioLinks_ID])
    REFERENCES [dbo].[PortfolioLinks]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PortfolioPostsLinks_PortfolioLinks'
CREATE INDEX [IX_FK_PortfolioPostsLinks_PortfolioLinks]
ON [dbo].[PortfolioPostsLinks]
    ([PortfolioLinks_ID]);
GO

-- Creating foreign key on [PortfolioPosts_ID] in table 'PortfolioPostsTags'
ALTER TABLE [dbo].[PortfolioPostsTags]
ADD CONSTRAINT [FK_PortfolioPostsTags_PortfolioPosts]
    FOREIGN KEY ([PortfolioPosts_ID])
    REFERENCES [dbo].[PortfolioPosts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PortfolioTags_ID] in table 'PortfolioPostsTags'
ALTER TABLE [dbo].[PortfolioPostsTags]
ADD CONSTRAINT [FK_PortfolioPostsTags_PortfolioTags]
    FOREIGN KEY ([PortfolioTags_ID])
    REFERENCES [dbo].[PortfolioTags]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PortfolioPostsTags_PortfolioTags'
CREATE INDEX [IX_FK_PortfolioPostsTags_PortfolioTags]
ON [dbo].[PortfolioPostsTags]
    ([PortfolioTags_ID]);
GO

-- Creating foreign key on [Posts_ID] in table 'PostsTags'
ALTER TABLE [dbo].[PostsTags]
ADD CONSTRAINT [FK_PostsTags_Posts]
    FOREIGN KEY ([Posts_ID])
    REFERENCES [dbo].[Posts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tags_ID] in table 'PostsTags'
ALTER TABLE [dbo].[PostsTags]
ADD CONSTRAINT [FK_PostsTags_Tags]
    FOREIGN KEY ([Tags_ID])
    REFERENCES [dbo].[Tags]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PostsTags_Tags'
CREATE INDEX [IX_FK_PostsTags_Tags]
ON [dbo].[PostsTags]
    ([Tags_ID]);
GO

-- Creating foreign key on [TutorialPosts_ID] in table 'TutorialPostsTags'
ALTER TABLE [dbo].[TutorialPostsTags]
ADD CONSTRAINT [FK_TutorialPostsTags_TutorialPosts]
    FOREIGN KEY ([TutorialPosts_ID])
    REFERENCES [dbo].[TutorialPosts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TutorialTags_ID] in table 'TutorialPostsTags'
ALTER TABLE [dbo].[TutorialPostsTags]
ADD CONSTRAINT [FK_TutorialPostsTags_TutorialTags]
    FOREIGN KEY ([TutorialTags_ID])
    REFERENCES [dbo].[TutorialTags]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorialPostsTags_TutorialTags'
CREATE INDEX [IX_FK_TutorialPostsTags_TutorialTags]
ON [dbo].[TutorialPostsTags]
    ([TutorialTags_ID]);
GO

-- Creating foreign key on [headerId] in table 'Contents'
ALTER TABLE [dbo].[Contents]
ADD CONSTRAINT [FK_Contents_Headers]
    FOREIGN KEY ([headerId])
    REFERENCES [dbo].[Headers]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Contents_Headers'
CREATE INDEX [IX_FK_Contents_Headers]
ON [dbo].[Contents]
    ([headerId]);
GO

-- Creating foreign key on [subjectID] in table 'Headers'
ALTER TABLE [dbo].[Headers]
ADD CONSTRAINT [FK_Headers_Subjects]
    FOREIGN KEY ([subjectID])
    REFERENCES [dbo].[Subjects]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Headers_Subjects'
CREATE INDEX [IX_FK_Headers_Subjects]
ON [dbo].[Headers]
    ([subjectID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------