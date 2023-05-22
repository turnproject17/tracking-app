# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Registry crud
```
  /registries
```
## Coordinator Crud
```
  /coordinators
```
## Participant Crud
```
  /participants
```
## Enrollments Crud
```
  /coordinators/:coordinator_id/enrollments
```

* Additional Questions

## Provide sql for aggregate count of participants by year of birth.
```
SELECT count(id) as count , date_trunc('year', participants.dob) as year FROM participants GROUP BY date_trunc('year', participants.dob)
```
## Provide sql for aggregate count of participants by coordinator and gender.
```
SELECT count(participants.id) as count, participants.gender , (select coordinators.email FROM coordinators where coordinators.id = enrollments.coordinator_id) as coordinator FROM participants LEFT OUTER JOIN enrollments ON enrollments.participant_id = participants.id GROUP BY coordinator, gender"
```

## Export participants for each coordinator in a csv format.

On Coordinator's index page there is a link ``export participants`` which will export all the participants with their enrollments.

