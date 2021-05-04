#!/bin/bash -v

cd data

touch corpus-ordered.en corpus-ordered.es corpus-ordered.en corpus-full.en corpus-ordered.es corpus-full.es corpus-dev-test.en corpus-dev-test.es corpus-dev.es corpus-dev.en

# create corpus files
cat Books.en-es.en DGT.en-es.en ECB.en-es.en EMEA.en-es.en europarl-v7.es-en.en MultiUN.en-es.en TED2013.en-es.en OpenSubtitles.en-es.en Wikipedia.en-es.en > corpus-ordered.en
cat Books.en-es.es DGT.en-es.es ECB.en-es.es EMEA.en-es.es europarl-v7.es-en.es MultiUN.en-es.es TED2013.en-es.es OpenSubtitles.en-es.es Wikipedia.en-es.es > corpus-ordered.es

# shuffle
shuf --random-source=corpus-ordered.en* corpus-ordered.en* > corpus-full.en
shuf --random-source=corpus-ordered.en* corpus-ordered.es* > corpus-full.es

# Make data splits
head -n -4000 corpus-full.en > corpus.en
head -n -4000 corpus-full.es > corpus.es
tail -n 4000 corpus-full.en > corpus-dev-test.en
tail -n 4000 corpus-full.es > corpus-dev-test.es
head -n 2000 corpus-dev-test.en > corpus-dev.en
head -n 2000 corpus-dev-test.es > corpus-dev.es
tail -n 2000 corpus-dev-test.en > corpus-test.en
tail -n 2000 corpus-dev-test.es > corpus-test.es

cd ..