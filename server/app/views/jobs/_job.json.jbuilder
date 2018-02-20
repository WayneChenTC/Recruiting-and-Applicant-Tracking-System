json.extract! job, :id, :company, :job_description, :employment_type, :responsibilities, :requirements, :created_at, :updated_at
json.url company_job_url(job.company, job, format: :json)
