FROM ethereumoptimism/foundry as foundry-builder

FROM trailofbits/eth-security-toolbox

COPY --from=foundry-builder /usr/local/bin/forge ${HOME}/.local/bin
COPY --from=foundry-builder /usr/local/bin/cast ${HOME}/.local/bin
COPY --from=foundry-builder /usr/local/bin/anvil ${HOME}/.local/bin
