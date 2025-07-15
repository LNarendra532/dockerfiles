FROM almalinux:9
#CMD ["ping","google.com"] 
CMD ["google.com"]
ENTRYPOINT ["ping"]

# Q. What is the Difference between CMD and ENTRYPOINT?
# A. CMD and ENTRYPOINT both are useful to run the containers, but there are few differences.
# 1. CMD can be overridden, ENTRYPOINT cant be overridden
# 2. If you try to override ENTRYPOINT it will go and append.
# 3. We can mix CMD and ENTRYPOINT for best results.
# 4. We can provide default arguments through CMD to the ENTRYPOINT.
# 5. Users can override those default arguments at runtime from the command line.
