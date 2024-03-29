select * from Words 

select * from Translations

select * from WordTranslationLinks

select * from Examples 

select * from ExampleSets

insert into Words (Word) values ('bog')

insert into WordTranslationLinks (WordId, TranslationId) VALUES (1, 2)
insert into WordTranslationLinks (WordId, TranslationId) VALUES (3, 1)

select w.Word,w.Transcription,t.Translation from Words w 
inner join WordTranslationLinks wtl on wtl.WordId = w.WordId
inner join Translations t on t.TranslationId = wtl.TranslationId

CREATE INDEX WordIndex ON Words (Word)

select w.Word,w.Transcription,t.Translation from Words w 
inner join WordTranslationLinks wtl on wtl.WordId = w.WordId
inner join Translations t on t.TranslationId = wtl.TranslationId
left join ExampleSets es on es.ExampleSetId = w.ExampleSetId
left join Examples e on e.ExampleSetId = es.ExampleId
where Word like '%bog%'

