# Summary — S3 Files and the changing face of S3

## Core idea

This post argues that the biggest storage pain point for many modern workloads is not raw capacity or durability, but friction between different data access models. S3 Files is presented as AWS's attempt to reduce that friction by letting existing S3 data be accessed directly through a filesystem interface.

## Key points

- The article starts with genomics research, where tools expected Linux filesystems even though cloud-scale parallel computation fit S3 well.
- That mismatch created constant copying, duplicate datasets, and operational overhead, which the author calls data friction.
- The author argues that agentic development makes this issue more important, because faster application creation increases the value of data layers that are easy to attach to.
- S3 Tables and S3 Vectors are framed as earlier examples of S3 evolving into higher-level data primitives.
- S3 Files extends that direction by integrating EFS with S3 so objects can be mounted and used like files.
- The article emphasizes that combining file and object semantics is technically hard because the two models assume very different behavior around mutation, sharing, and notification.

## One-line takeaway

S3 Files is not just a new AWS feature, it is part of a broader move to make S3 a lower-friction data platform across multiple access patterns.
