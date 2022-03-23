from bcrypt import hashpw, gensalt

hashed = hashpw("hunter2".encode("utf-8"), gensalt(13))
print(hashed)  # Value to save in the database for this user

# Explanation (example):
# $2b$13$yxyBS33ultFrKvTQ.KEcmO6H6fpQNrR32m55tQF8OiJrRGBWfplWm
# |  |  |                      |
# $bcrypt_id                   |
#    |  |                      |
#    $log_rounds               |
#       |                      |
#       $128-bit-salt          |
#                              184-bit-hash
