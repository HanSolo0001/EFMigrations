﻿CREATE TABLE [dbo].[ComicBookAverageRating] (
    [Id] [int] NOT NULL IDENTITY,
    [ComicBookId] [int] NOT NULL,
    [AverageRating] [decimal](5, 2) NOT NULL,
    [Date] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.ComicBookAverageRating] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_ComicBookId] ON [dbo].[ComicBookAverageRating]([ComicBookId])

                insert into ComicBookAverageRating
                select Id, AverageRating, getdate() from ComicBook 
                where AverageRating is not null
            
DECLARE @var0 nvarchar(128)
SELECT @var0 = name
FROM sys.default_constraints
WHERE parent_object_id = object_id(N'dbo.ComicBook')
AND col_name(parent_object_id, parent_column_id) = 'AverageRating';
IF @var0 IS NOT NULL
    EXECUTE('ALTER TABLE [dbo].[ComicBook] DROP CONSTRAINT [' + @var0 + ']')
ALTER TABLE [dbo].[ComicBook] DROP COLUMN [AverageRating]
ALTER TABLE [dbo].[ComicBookAverageRating] ADD CONSTRAINT [FK_dbo.ComicBookAverageRating_dbo.ComicBook_ComicBookId] FOREIGN KEY ([ComicBookId]) REFERENCES [dbo].[ComicBook] ([Id]) ON DELETE CASCADE
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201703210356355_ComicBookAverageRatingEntity', N'ComicBookGalleryModel.Migrations.Configuration',  0x1F8B0800000000000400ED5CDD4EE43816BE5F69DE21CAD5ECAA8700AD966651D58CBAA119A11DA045D1A3BD432631453489531B3B08B49A279B8B79A47D85B5F3EBBF38CE4F55A5116AA905897D8E7DFC9D9373ECCFFCEFCFBF163F3FC791F304531C2668E91E1D1CBA0E447E128468BD7433F2F0C38FEECF3F7DF7B7C5E7207E767EABDABD67ED684F8497EE23219B13CFC3FE238C013E88433F4D70F2400EFC24F6409078C78787FFF48E8E3C4845B85496E32C6E3244C218E6BFD05F4F13E4C30DC94074990430C2E573FA66954B75AE400CF106F870E99E2654C3A724F9FD171045307DC97B1C9C01025CE76314023AA2158C1E5C0720941040E8784FBE62B8226982D6AB0D7D00A2DB970DA4ED1E408461398F93A6B9ED940E8FD994BCA66325CACF3049E29E028FDE9736F2E4EE832CEDD636A456FC4CAD4D5ED8AC734B2EDD8F290931711D59D5C96994B2666D662E96E7A0E8FECED1367A57C384A289FDA3EDB28864295C22989114D0165FB2FB28F4FF055F6E93DF215AA22C8AF801D321D377C203FAE84B9A6C604A5E6EE043398D8BC0753CB19F2777ACBB717D8A295E20F2FED875AEA872701FC11A0F9C39562449E12F10C11410187C0184C014311930B7A8A25DD2C5FEAFB45100529F729D4BF0FC2B446BF248BDED907AD179F80C83EA493982AF28A42E483B9134839A119AB57E0A138352FAE3244AAFC053B8CEAD24A9AF41815DE706467913FC186E0ABF3CA85F1720BAABA0789E26F14D12F102841677B7205D43DAF03631365B2559EA4BC35D788D0718FD429239D84124396F9ED285D9DA3EDD4ACD820A838F95C210D65B46AB4754609AD21B2A98777843E534BD9DD73CDA523CD60EB47AD9EEB1750B9DB39A86C7E458D9B168D86E45F6B4D38679239D05FBC793F191E42D867439ED0AA621C4635DFF02E30C5E65F13D4CC7093A83D84FC34D91C18DFE1C9B75E52B8C1F61705DEBA21931BC0DE3315FF2DAC9C787825657538285F5E068D102D6F086BE43EBAE54836F7BC739A52E40E8DB1AD28F960E7D635B015FED448A57777C66D58C5C79A90C556D315192C4CF7C825C8917F716EE76973289CB58860FE88731885CE74B4A7F2AAAFE0FAEB3F201933B201AD2394E189A2CF394291CBF3D4BE88814839CAB8A02039DA9E8FEE63C5D70BC0D49642ACD8FB7539A6F3527185A91F7FCBAC8FED0FEFD19E40045E63E10FEACF31BF8476E4B7D9800FA6DCBFD11E3C40FF359E8B75CAA0A589CC067143876E57031294D4948A748973BDCD005A6E35ABAFF50ACD4A9A4CEAB1A257AD947AE0C926B74062348A0F3D12F76844F01F641A03A31B55B203EA1B882295B58109D52BFA5480D11514118223FDC80C86A06526F4B10B3D1D57AE43767700311C39FD53AD90CA0D9C95187516B938CD765AB85C701D012977581D38916B5DAD1A071AB58310D4A83DEDE2E320E8BB27D760943D90C36BA850C7BBF206C4B64BB23585756AB438358100C899B5D45F4AE1D636410354F67A7E1D4BC9EDF06ACD58CB30D5186F4B381505533ED24B01AB65B2C403D51486D35CB0EA0D86A001BDDCD1EED9EE329774C609B058A67065B49348513074E455114CD373EAAA3DF438AC9AF8F8DFAEA906F07482C8A21DA87D01E30ADD188087CD69D327FC5B02C7871596EC90862F25690C83BF54DD52515280A044501922D75921498DB8A340AEB313269C3DF3040317FE950507D3D1479D58B8EFE0C46BAEE85CF4A9D397CB41ABF3E04E61A9B8F8B65005B97CBF55C740850FCC2BA40E6C4B648133C8536EC63A5E6C4C960207DD56659B7E9CC626910A5DCEA61E2314669DDE93681C8A6A818565668672D39B015BE3A0A09AB951A6057CD9EA86AC88E34D63291E5A6A08F3896E9E7B64CA1A75674C72635B7B2CFAEA68A4B423EC5092D63B6B56DAAEDCCFA0B5EBF5B780545B57CB0F05AB8AC8B4BB0D930DC373DCB27CEAA24B6FEB0EACFF48C0B199E2F604FCE376A4D2461DE24BD65660BE0799862C268B4F7806DE69E06B1A65991AFB47C0F2B2D624AA22E56F59DACDAB39F25A829DCDE03FD97AEB1E2399D58CC72C37C6F5CF900A91D1D462E061148351BF1A74994C5A83D496DEF5D6CADF3FD8B27F61272F6262F207FA0F65F78D2CC952C56B1B45204880B67B5AC8A3B4EB4BE7276D97FA13B256C67C585DD145E8C719BA55D5EB3EDCD0B6BDF0C6F9754D537BC9CB69A67FF789A1E496330B42BF434FB21BC8CF65D12C33878DE9A3020FE85BD3CE1A89A9727BCB0972750D47879C28BF9E152CA5A270F7742AD3A26EA99057D23C14FACDC8508682AEA4D320BE69180E0FCC96CA05666FD13214B2FCD02496D1DB7839C9280C30B281F6D3F44ED699D8BA263A265D65557168BACEFB6EF5C78AB0BA2D46E72935A7B5DC349B5DAA2AC9B6C2E274A8554D184B12893A7306045D4EA05131897BEFA9FE8340AE97C9B069700850F10938281E41E1F1E1D4BF71AE773C7D0C338883475A77AD1505CAD1D90A84266D34E9A544FF61ECF9B424F20F51F41AA5EE81B7E5BAF92F97D0C9EFF3E9060D579A5ED752C8586FC9CEB514E522E50009F97EE7FF37E27CEC5BFEFB8AEEF9CEB94FADC8973E8FC31FAA699ADFEAADF28E5E205355BD545AF1E8A075C747A1DF892EF12D95AB8EA376A7135579072FDE3C9C6AD1166E025A3805A9B7433F9C75E2D791D989A43CCD25DF508B678D5636A80E88A946F1610C225046D42713C20A118E7F6FD78FAAF631D3AF3BA0F5DABB035BA7B4505D82DE5BCF5406D0FECE1D6F3806DF3895E29497D1EACF4BDC1C9743A300B44ED9F9D3B9E743E138CE9929D514CF76F09711DE70A73045E5F5AF8FE48E03D913E29EB7BA7307A75A4EE82BDB44B6AF59CBE7E2DA706B3F8F0CD808E2DB3A0E485D491AE0D9CEB62F39F16C1F76C8BB7281E86F1B16DE8D83A6D8339DB66CAB651D54046770F42B779A6D392BF75BA7A10C35B79E13AB9B3608C8B80E329743D88972606E7ACA9E0FA81CF71EA3B267C8F328CCECF4DEC95D9F2B7FBB2B57B9A6F3EEC6C3E7635C481DDBB410FE2B57A484F3304EEEF0CD3240587EB4604FBABC308FA426E50B7B9400F4995A24823AA9A489B8897908080260E6C8A0FC027F4B50F31CEE1FC1B8832DAE4737C0F830B749D914D46E894617C1F097FAC83A53A26FD39BB5C1CF3E23ADFE9C5534C810E33641BF6D7E8531646413DEE73CD86678B089643953BB36C2D09DBA15DBFD492AE126429A8345F9DFADDC278135161F81AADC0131C32B6AF18FE0AD7C07FA9B816ED42BA174234FBE22C04EB14C4B894D1F4A7BF520C07F1F34FFF070C2B921D6E5B0000 , N'6.1.3-40302')
