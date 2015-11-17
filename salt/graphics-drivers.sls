{% for gpu in grains['gpus'] %}
{% if gpu['vendor'] == 'nvidia' %}
nvidia-current:
  pkg.installed
{% endif %}
{% endfor %}
